import * as admin from 'firebase-admin';
import { HttpsError, onCall } from "firebase-functions/v2/https";
import { onDocumentUpdated } from "firebase-functions/v2/firestore";
import { onSchedule } from "firebase-functions/v2/scheduler";
import * as logger from "firebase-functions/logger";

admin.initializeApp();
const db = admin.firestore();

const TWENTY_FOUR_HOURS_MS = 24 * 60 * 60 * 1000;
// YENİ: 24 saat + 10 dakika (cron job gecikmesi için tampon)
const TWENTY_FOUR_HOURS_AND_10_MINS_MS = TWENTY_FOUR_HOURS_MS + (10 * 60 * 1000);
// YENİ: 5 dakika (reklam boost cron job'u için)
const FIVE_MINUTES_MS = 5 * 60 * 1000;


// =========================================================
// YARDIMCI FONKSİYONLAR
// =========================================================

const getMiningRateForTotalUsers = (totalUsers: number): number => {
  if (totalUsers < 10000) return 1.00;
  if (totalUsers < 20000) return 0.95;
  if (totalUsers < 30000) return 0.90;
  if (totalUsers < 40000) return 0.85;
  if (totalUsers < 50000) return 0.80;
  if (totalUsers < 60000) return 0.75;
  if (totalUsers < 70000) return 0.70;
  if (totalUsers < 80000) return 0.65;
  if (totalUsers < 90000) return 0.60;
  if (totalUsers < 100000) return 0.55;
  if (totalUsers < 200000) return 0.45;
  if (totalUsers < 300000) return 0.40;
  if (totalUsers < 400000) return 0.34;
  if (totalUsers < 500000) return 0.28;
  if (totalUsers < 600000) return 0.21;
  if (totalUsers < 700000) return 0.15;
  if (totalUsers < 800000) return 0.10;
  if (totalUsers < 900000) return 0.06;
  if (totalUsers < 1000000) return 0.03;
  if (totalUsers < 2000000) return 0.01;
  return 0.005;
};

const generateReferralCode = (): string => {
  const timestampPart = Date.now().toString(36).toUpperCase().slice(-4);
  const randomPart = Math.random().toString(36).substring(2, 6).toUpperCase();
  const combined = `${randomPart}${timestampPart}`;
  return combined.substring(0, 8);
};

const getBonusPercentageForTeamSize = (teamSize: number): number => {
  if (teamSize >= 25) return 0.35; // Altın (%35)
  if (teamSize >= 10) return 0.30; // Gümüş (%30)
  if (teamSize >= 5) return 0.27;  // Bronz (%27)
  return 0.25; // Standart (%25)
};

/**
 * Belirtilen fcmToken'a sahip kullanıcıya bildirim gönderir.
 * YENİ: Geçersiz token hatası alınırsa, token'ı Firestore'dan siler.
 * @param {string} fcmToken Kullanıcının cihaz token'ı.
 * @param {string} title Bildirim başlığı.
 * @param {string} body Bildirim içeriği.
 */
const sendNotification = async (fcmToken: string, title: string, body: string) => {
  if (!fcmToken) {
    logger.warn("FCM token eksik, bildirim gönderilemiyor.");
    return;
  }

  const message: admin.messaging.Message = {
    notification: {
      title: title,
      body: body,
    },
    data: {
      click_action: "FLUTTER_NOTIFICATION_CLICK",
      screen: "HOME_SCREEN",
    },
    token: fcmToken,
    android: {
        notification: {
            channelId: "default",
            sound: "default",
            priority: "high",
        }
    },
    apns: {
        payload: {
            aps: {
                sound: "default",
            }
        }
    }
  };

  try {
    await admin.messaging().send(message);
    logger.info(`Bildirim başarıyla gönderildi: ${title}`);
  } catch (error: any) {
    logger.error("Bildirim gönderme hatası:", error);

    // --- YENİ EKLENEN BLOK (Geçersiz Token Silme) ---
    // Eğer hata, token'ın geçersiz olduğunu belirtiyorsa
    const invalidTokenErrorCodes = [
        'messaging/invalid-registration-token',
        'messaging/registration-token-not-registered'
    ];

    if (invalidTokenErrorCodes.includes(error.code)) {
      logger.warn(`Geçersiz FCM token tespit edildi: ${fcmToken}. Token Firestore'dan siliniyor...`);
      try {
        // Bu token'a sahip kullanıcıyı bul
        const userQuery = await db.collection('users')
                                  .where('fcmToken', '==', fcmToken)
                                  .limit(1)
                                  .get();

        if (!userQuery.empty) {
          const userDocRef = userQuery.docs[0].ref;
          // Kullanıcının fcmToken alanını null yap
          await userDocRef.update({ fcmToken: null });
          logger.info(`Kullanıcı ${userDocRef.id} için geçersiz FCM token başarıyla silindi.`);
        } else {
          logger.warn(`Firestore'da ${fcmToken} token'ına sahip kullanıcı bulunamadı.`);
        }
      } catch (dbError) {
        logger.error(`Geçersiz FCM token'ı Firestore'dan silerken hata oluştu:`, dbError);
      }
    }
    // --- YENİ BLOK BİTTİ ---
  }
};
// --- FONKSİYON GÜNCELLEMESİ BİTTİ ---


// =========================================================
// CLOUD FUNCTIONS
// =========================================================

// 🚀 Yeni Kullanıcı Kayıt Fonksiyonu (GÜNCELLENDİ: Cihaz Kilidi Eklendi)
export const registerNewUser = onCall(async (request) => {
  logger.info("registerNewUser v4.0 (Device Lock) tetiklendi", request.data);

  // --- APP CHECK SİLİNDİ ---

  const data = request.data;
  // deviceId parametresini de alıyoruz (Flutter'dan gelecek)
  const deviceId = data.deviceId;

  if (!data.email || !data.password || !data.username) {
    throw new HttpsError('invalid-argument', 'Email, password, and username are required.');
  }

  const firestore = admin.firestore();

  // --- 0. CİHAZ KİLİDİ KONTROLÜ (EN BAŞTA) ---
  // Eğer cihaz kimliği geldiyse, daha önce kayıt yapılmış mı diye bak
  if (deviceId) {
      const deviceDoc = await firestore.collection('device_locks').doc(deviceId).get();
      if (deviceDoc.exists) {
          logger.warn(`Hile Girişimi: ${deviceId} cihazı zaten kayıtlı.`);
          // Hileciye özel hata fırlat
          throw new HttpsError('resource-exhausted', 'Bu cihazda zaten bir hesap oluşturulmuş. Güvenlik gereği cihaz başına 1 hesaba izin verilir.');
      }
  }
  // -------------------------------------------

  try {
    const auth = admin.auth();
    const email = data.email;
    const password = data.password;
    const username = data.username;
    const referralCode = data.referralCode;

    // 1. Auth kullanıcısını oluştur
    const userRecord = await auth.createUser({ email, password, displayName: username });
    const uid = userRecord.uid;

    // --- CİHAZI KİLİTLE (Kullanıcı oluştuğu an) ---
    if (deviceId) {
        await firestore.collection('device_locks').doc(deviceId).set({
            uid: uid,
            registeredAt: admin.firestore.FieldValue.serverTimestamp()
        });
    }
    // --------------------------------------------

    // 2. Toplam kullanıcı sayacını artır
    const userCounterRef = firestore.collection('app_stats').doc('user_counter');
    const newTotalUsers = await firestore.runTransaction(async (transaction) => {
      const doc = await transaction.get(userCounterRef);
      const currentTotalUsers = (doc.exists && doc.data()?.total_users) ? doc.data()?.total_users : 0;
      const updatedTotalUsers = currentTotalUsers + 1;
      transaction.set(userCounterRef, { total_users: updatedTotalUsers }, { merge: true });
      return updatedTotalUsers;
    });

    // 3. Yeni kullanıcının madencilik oranını al
    const baseMiningRate = getMiningRateForTotalUsers(newTotalUsers);

    // 4. Yeni kullanıcının KENDİ davet kodunu oluştur
    const newUserReferralCode = generateReferralCode();

    // 5. Referans (davet eden) bilgilerini işle
    let referrerUid: string | null = null;
    let hasValidReferrer = false;
    let referrerUpdates = {};
    let referrerData: admin.firestore.DocumentData | null = null;

    if (referralCode) {
      const referrerUserQuery = await firestore.collection('users').where('referral_code', '==', referralCode).limit(1).get();
      if (!referrerUserQuery.empty) {
        referrerUid = referrerUserQuery.docs[0].id;
        referrerData = referrerUserQuery.docs[0].data();
        hasValidReferrer = true;

        const currentTeamSize = (referrerData.team_members as string[])?.length || 0;
        const newTeamSize = currentTeamSize + 1;
        const newBonusPercentage = getBonusPercentageForTeamSize(newTeamSize);
        let newTier = "Standard";
        if (newTeamSize >= 25) newTier = "Gold";
        else if (newTeamSize >= 10) newTier = "Silver";
        else if (newTeamSize >= 5) newTier = "Bronze";

        referrerUpdates = {
          team_members: admin.firestore.FieldValue.arrayUnion(uid),
          current_bonus_tier: newTier,
          current_bonus_percentage: newBonusPercentage,
        };
      } else {
         logger.warn(`Geçersiz referans kodu kullanıldı: ${referralCode}`);
      }
    }

    // 6. Yeni kullanıcının 2X Boost durumunu ayarla
    const now = admin.firestore.Timestamp.now();
    const starterBoostExpires = hasValidReferrer
        ? admin.firestore.Timestamp.fromMillis(now.toMillis() + TWENTY_FOUR_HOURS_MS)
        : null;

    // 7. YENİ KULLANICI DÖKÜMANINI AYARLA
    await firestore.collection('users').doc(uid).set({
      username: username,
      email: email,
      coin_balance: hasValidReferrer ? 1.0 : 0.0,
      base_mining_rate: baseMiningRate,
      active_team_bonus_rate: 0,
      last_activation_time: null,
      referral_code: newUserReferralCode,
      referred_by: referrerUid,
      team_members: [],
      created_at: now,
      is_active: false,
      profileImageUrl: null,
      last_login: now,
      usernameLastChangedAt: null,
      is_on_starter_boost: hasValidReferrer,
      starter_boost_expires: starterBoostExpires,
      accumulatedAdBonus: 0.0,
      adsWatchedToday: 0,
      lastAdWatchTimestamp: null,
      adBoostExpiryTime: null,
      lastMiningNotificationSentAt: null,
      active_team_member_count: 0,
      current_bonus_tier: "Standard",
      current_bonus_percentage: 0.25,
      has_completed_onboarding: false,
      deviceId: deviceId || null, // Cihaz ID'sini de kaydedelim
      notification_settings: {
                miningReminders: true,
                teamReminders: true,
                adBoostReminders: true,
            },
    });

    // 8. Referansı (varsa) güncelle VE ÇİFT YÖNLÜ CACHE OLUŞTUR
    if (referrerUid && referrerData) {
        const referrerRef = firestore.collection('users').doc(referrerUid);
        const referrerCacheRef = referrerRef.collection('team_members_cache').doc(uid);
        const newUserCacheRef = firestore.collection('users').doc(uid).collection('team_members_cache').doc(referrerUid);

        const batch = db.batch();

        // 1. Ana dökümanı güncelle (referrer'ın takım listesini)
        batch.update(referrerRef, referrerUpdates);

        // 2. Referansın alt koleksiyonunu oluştur
        batch.set(referrerCacheRef, {
            username: username,
            profileImageUrl: null,
            is_active: false,
            handle: `@${newUserReferralCode}`
        });

        // 3. Yeni kullanıcının alt koleksiyonunu oluştur
        batch.set(newUserCacheRef, {
            username: referrerData.username ?? "Referrer",
            profileImageUrl: referrerData.profileImageUrl ?? null,
            is_active: referrerData.is_active ?? false,
            handle: `@${referrerData.referral_code ?? 'CODE'}`
        });

        await batch.commit();
    }

    logger.info(`Yeni kullanıcı kaydedildi v4.0: ${uid}`);
    return { success: true, message: 'User registered successfully.' };

  } catch (error: any) {
    logger.error('Kullanıcı kaydı v4.0 hatası:', error);
    if (error.code === 'auth/email-already-in-use') {
      throw new HttpsError('already-exists', 'This email is already registered.');
    }
    if (error instanceof HttpsError) {
       throw error;
    }
    throw new HttpsError('internal', error.message || 'An unknown error occurred during registration.');
  }
});


// index.ts (onUserCounterUpdate fonksiyonunun TAMAMI)
export const onUserCounterUpdate = onDocumentUpdated("app_stats/user_counter", async (event) => {
  if (!event.data) { logger.error("onUserCounterUpdate event data eksik!"); return; }
  const newData = event.data.after.data();
  const oldData = event.data.before.data();
  const newTotalUsers = newData?.total_users as number;
  const oldTotalUsers = oldData?.total_users as number;

  logger.info(`onUserCounterUpdate v3 (Maliyet Optimize) tetiklendi. Eski: ${oldTotalUsers}, Yeni: ${newTotalUsers}`);

  if (newTotalUsers <= oldTotalUsers) {
    logger.info('Toplam kullanıcı v3 artmadı/düştü, işlem yok.');
    return;
  }

  const currentMiningRateForOldTotal = getMiningRateForTotalUsers(oldTotalUsers);
  const newMiningRateForNewTotal = getMiningRateForTotalUsers(newTotalUsers);

  if (newMiningRateForNewTotal < currentMiningRateForOldTotal) {
    logger.info(`YARI-LAN-MA v3 GEÇİLDİ! Eski oran: ${currentMiningRateForOldTotal}, Yeni: ${newMiningRateForNewTotal}.`);
    logger.info("Kullanıcı dökümanları GÜNCELLENMİYOR (Maliyet optimizasyonu). Oranlar 'activateMining' sırasında güncellenecek.");
  } else {
    logger.info('Yarılanma v3 eşiği geçilmedi.');
  }
  // TÜM BATCH GÜNCELLEME KODU SİLİNDİ.
});


// ⛏️ Madencilik Aktivasyon Fonksiyonu (activateMining - APP CHECK KALDIRILDI)
export const activateMining = onCall(async (request) => {
  // v4.0: App Check + Halving Optimizasyonu içerir
  logger.info("activateMining v4.0 (Halving Optimize + App Check) tetiklendi.");

  // --- APP CHECK SİLİNDİ ---

  if (!request.auth) { throw new HttpsError('unauthenticated', 'User must be authenticated.'); }

  const uid = request.auth.uid;
  const userRef = db.collection('users').doc(uid);
  const appStatsRef = db.collection('app_stats').doc('global_counter');
  const NOW = Date.now();

  try {
    let earnedCoinsInThisCycle = 0;
    let wasActive = false;

    const userDoc = await userRef.get();
    if (!userDoc.exists) { throw new HttpsError('not-found', 'User data not found.'); }
    const userData = userDoc.data();
    if (!userData) throw new HttpsError('not-found', 'User data is empty.');

    // --- ADIM 2: HALVING OPTİMİZASYONU BAŞLANGIÇ ---
    // 1. YENİ SEANS için global oranı ŞİMDİDEN AL
    const userCounterDoc = await db.collection('app_stats').doc('user_counter').get();
    const totalUsers = userCounterDoc.data()?.total_users ?? 0;
    const NEW_GLOBAL_BASE_RATE = getMiningRateForTotalUsers(totalUsers);
    // --- ADIM 2: HALVING OPTİMİZASYONU BİTTİ ---


    const lastActivationTime = userData.last_activation_time as admin.firestore.Timestamp | null;

    // --- GEÇMİŞ SEANS HESAPLAMASI (DEĞİŞTİ) ---
    if (lastActivationTime) {
          const twentyFourHoursLater = lastActivationTime.toDate().getTime() + TWENTY_FOUR_HOURS_MS;
          if (NOW < twentyFourHoursLater) {
             // 2X boost kontrolü (seans devam ederken bitmişse)
            if (userData.is_on_starter_boost === true && userData.starter_boost_expires && NOW > userData.starter_boost_expires.toMillis()) {
                 await userRef.update({ is_on_starter_boost: false });
                 logger.info(`Kullanıcı ${uid} için 2X boost kapatıldı (seans devam ediyor).`);
            }
            throw new HttpsError('already-exists', 'Mining is already active. Please wait 24 hours.');
          }

          wasActive = userData.is_active;

          // YENİ HESAPLAMA: Sadece dökümandaki KAYITLI (GEÇMİŞ) oranları kullan
          const baseRateForPayment = (userData.base_mining_rate as number) || 0;
          const bonusRateForPayment = (userData.active_team_bonus_rate as number) || 0;

          let effectiveRateFromPastCycle = baseRateForPayment + bonusRateForPayment;

          // --- Boost mantığını geri ekle (BU KISIM DEĞİŞMEDİ) ---
          const isOnStarterBoost = userData.is_on_starter_boost === true;
          const starterBoostExpiresTime = userData.starter_boost_expires as admin.firestore.Timestamp | null;

          if (isOnStarterBoost && starterBoostExpiresTime && lastActivationTime.toMillis() < starterBoostExpiresTime.toMillis()) {
              effectiveRateFromPastCycle *= 2;
          }



          const msPassed = Math.min(NOW - lastActivationTime.toDate().getTime(), TWENTY_FOUR_HOURS_MS);
          const hoursPassed = msPassed / (1000 * 60 * 60);

          earnedCoinsInThisCycle = hoursPassed * effectiveRateFromPastCycle;
        }
    // --- GEÇMİŞ SEANS HESAPLAMASI BİTTİ ---


    // --- YENİ SEANS HESAPLAMASI (DEĞİŞTİ) ---
    // baseMiningRate -> NEW_GLOBAL_BASE_RATE olarak değişti
    const activeTeamCount = (userData.active_team_member_count as number) || 0;
    const currentBonusPercentage = (userData.current_bonus_percentage as number) || 0.25;

    // YENİ BASİT HESAPLAMA:
    const calculatedBonusRateForNewCycle = activeTeamCount * currentBonusPercentage * NEW_GLOBAL_BASE_RATE; // <-- DEĞİŞİKLİK BURADA

    // --- YENİ SEANS HESAPLAMASI BİTTİ ---

    // 2X Boost'un yeni seans için hala geçerli olup olmadığını kontrol et (Değişiklik yok)
    let isStarterBoostStillActive = userData.is_on_starter_boost === true;
    const starterBoostExpiresTime = userData.starter_boost_expires as admin.firestore.Timestamp | null;
    if (isStarterBoostStillActive && starterBoostExpiresTime && NOW > starterBoostExpiresTime.toMillis()) {
        isStarterBoostStillActive = false;
    }

    const accumulatedAdBonusToPay = (userData.accumulatedAdBonus as number) || 0.0;

    // --- REFERANS GÜNCELLEME MANTIĞI (DEĞİŞİKLİK YOK) ---
    const referrerUid = userData.referred_by as string | null;
    let referrerRef: admin.firestore.DocumentReference | null = null;
    let referrerCacheRef: admin.firestore.DocumentReference | null = null;

    if (referrerUid && !wasActive) { // Sadece pasiften aktife geçerken
        referrerRef = db.collection('users').doc(referrerUid);
        referrerCacheRef = referrerRef.collection('team_members_cache').doc(uid);
    }
    // --- BİTTİ ---


    await db.runTransaction(async (transaction) => {
      // 1. Kullanıcının kendi dökümanını güncelle
      transaction.update(userRef, {
        coin_balance: admin.firestore.FieldValue.increment(earnedCoinsInThisCycle + accumulatedAdBonusToPay),
        accumulatedAdBonus: 0.0,
        last_activation_time: admin.firestore.FieldValue.serverTimestamp(),
        is_active: true,
        active_team_bonus_rate: calculatedBonusRateForNewCycle, // YENİ HESAPLANAN ORAN
        base_mining_rate: NEW_GLOBAL_BASE_RATE, // <-- KRİTİK GÜNCELLEME (Yeni global oranı dökümana yaz)
        is_on_starter_boost: isStarterBoostStillActive, // YENİ KONTROL EDİLEN DURUM
        lastMiningNotificationSentAt: null,
      });

      // 2. Global sayaçları güncelle
      transaction.set(appStatsRef, {
          total_on_mined: admin.firestore.FieldValue.increment(earnedCoinsInThisCycle + accumulatedAdBonusToPay)
      }, { merge: true });

      if (!wasActive) {
          transaction.set(appStatsRef, {
              total_active_miners: admin.firestore.FieldValue.increment(1)
          }, { merge: true });

          // 3. Referansın sayaçlarını ve cache'ini güncelle
          if (referrerRef && referrerCacheRef) {
              // Referansın aktif üye sayacını 1 artır
              transaction.update(referrerRef, {
                  active_team_member_count: admin.firestore.FieldValue.increment(1)
              });
              // Referansın cache'indeki bu kullanıcının durumunu 'aktif' yap
              transaction.update(referrerCacheRef, {
                  is_active: true
              });
          }
      }
    });

    return {
        success: true,
        message: 'Mining activated successfully.',
        earned: earnedCoinsInThisCycle + accumulatedAdBonusToPay
    };

  } catch (error: any)
  {
    logger.error(`Kullanıcı ${uid} aktivasyon v4.0 hatası:`, error);
    if (error instanceof HttpsError) throw error;
    throw new HttpsError('internal', 'An unexpected error occurred during activation.');
  }
});





// ⏳ Süresi Dolanları Pasifleştirme (deactivateExpiredMiners - AYNI KALDI)
export const deactivateExpiredMiners = onSchedule('every 10 minutes', async (event) => {
  logger.info("deactivateExpiredMiners v3.1 (Cache Fix) cron job tetiklendi.");
  const usersRef = db.collection('users');

  const twentyFourHoursAgo = admin.firestore.Timestamp.fromMillis(Date.now() - TWENTY_FOUR_HOURS_AND_10_MINS_MS);

  try {
    // ÖNCE: Sadece bildirim gönderilecekleri bul (son 10dk içinde süresi dolmuş VE bildirim almamış olanlar)
    const notificationSnapshot = await usersRef
        .where('is_active', '==', true)
        .where('last_activation_time', '<=', twentyFourHoursAgo)
        .where('lastMiningNotificationSentAt', '==', null)
        .get();

    // SONRA: Pasifleştirilecek HERKESİ bul (süresi dolmuş herkes)
    const deactivationSnapshot = await usersRef
        .where('is_active', '==', true)
        .where('last_activation_time', '<=', twentyFourHoursAgo)
        .get();

    if (deactivationSnapshot.empty) {
      logger.info("Pasifleştirilecek (v3.1) kullanıcı bulunamadı.");
      return;
    }

    logger.info(`Pasifleştiriliyor (v3.1): ${deactivationSnapshot.size} kullanıcı... Bildirim gönderiliyor: ${notificationSnapshot.size} kullanıcı...`);

    const batch = db.batch();
    const notificationPromises: Promise<void>[] = [];

    // 1. Bildirimleri Gönder
        notificationSnapshot.docs.forEach(doc => {
          const userData = doc.data();
          const fcmToken = userData.fcmToken as string | null;

          // --- YENİ KONTROL ---
          const settings = userData.notification_settings as { miningReminders?: boolean } | null;

          // <-- EKSİK SATIR BURASIYDI
          // Varsayılan olarak 'true' (açık) kabul ediyoruz
          const canSendMiningReminder = settings?.miningReminders ?? true;
          // --- BİTTİ ---

          if (fcmToken && canSendMiningReminder) { // <-- GÜNCELLENDİ
            notificationPromises.push(
              sendNotification(
                fcmToken,
                "Your session has ended!",
                "Your 24-hour ON mining session has expired. Tap to restart mining!"
              )
            );
          }
          // Bildirim gönderildi olarak işaretle
          batch.update(doc.ref, {
              lastMiningNotificationSentAt: admin.firestore.FieldValue.serverTimestamp()
          });
        });

    // 2. Herkesi Pasifleştir (Bildirim gidenler + gitmeyenler)
    deactivationSnapshot.docs.forEach(doc => {
        const userData = doc.data();

        // ANA GÜNCELLEME: Kullanıcıyı pasif yap
        batch.update(doc.ref, {
            is_active: false,
        });

        // --- DOĞRU CACHE GÜNCELLEMESİ ---
        // (Kopyalanan hatalı kod bloğu tamamen kaldırıldı)
        const referrerUid = userData.referred_by as string | null;
        if (referrerUid) {
            const referrerRef = db.collection('users').doc(referrerUid);
            // 'doc.id' -> pasifleşen kullanıcının ID'sidir.
            const referrerCacheRef = referrerRef.collection('team_members_cache').doc(doc.id);

            // Referansın aktif üye sayacını 1 azalt
            batch.update(referrerRef, {
                active_team_member_count: admin.firestore.FieldValue.increment(-1)
            });
            // Referansın cache'indeki bu kullanıcının durumunu 'pasif' yap
            batch.update(referrerCacheRef, {
                is_active: false
            });
        }
        // --- DOĞRU GÜNCELLEME BİTTİ ---
    });


    await Promise.all(notificationPromises);
    await batch.commit();

    logger.info(`${deactivationSnapshot.size} kullanıcı v3.1 başarıyla pasifleştirildi. ${notificationPromises.length} bildirim gönderildi.`);

  } catch (error) {
    logger.error("deactivateExpiredMiners v3.1 cron hatası:", error);
  }
});


// 🔎 Kullanıcı Adı Benzersizlik Kontrolü (checkUsernameUniqueness - APP CHECK KALDIRILDI)
export const checkUsernameUniqueness = onCall(async (request) => {
  logger.info("checkUsernameUniqueness v2 tetiklendi", request.data);

  // --- APP CHECK SİLİNDİ ---

  if (!request.auth) { throw new HttpsError('unauthenticated', 'You must be authenticated.'); }

  const uid = request.auth.uid;
  const { username } = request.data;
  if (!username || typeof username !== 'string' || username.length < 3) {
    throw new HttpsError('invalid-argument', 'Username must be at least 3 characters long.');
  }

  const userDoc = await db.collection('users').doc(uid).get();
  if (!userDoc.exists) {
    throw new HttpsError('not-found', 'Authenticated user document not found.');
  }
  const userData = userDoc.data();
  const lastChangedTimestamp = userData?.usernameLastChangedAt as admin.firestore.Timestamp | null;

  if (lastChangedTimestamp) {
      const thirtyDaysAgo = Date.now() - (30 * 24 * 60 * 60 * 1000);
      if (lastChangedTimestamp.toDate().getTime() > thirtyDaysAgo) {
          const daysPassed = Math.floor((Date.now() - lastChangedTimestamp.toDate().getTime()) / (24 * 60 * 60 * 1000));
          const daysLeft = 30 - daysPassed;
          throw new HttpsError('failed-precondition', `You can change username once every 30 days. ${daysLeft} days left.`);
      }
  }

  const usersRef = db.collection('users');
  const snapshot = await usersRef.where('username', '==', username).limit(1).get();

  if (snapshot.empty) {
    return { isUnique: true };
  } else {
    const doc = snapshot.docs[0];
    if (doc.id === uid) {
      return { isUnique: true };
    }
  }
  return { isUnique: false };
});


// 🔔 Hatırlatma Bildirimi Gönderme Fonksiyonu (sendReminderNotification - APP CHECK KALDIRILDI)
export const sendReminderNotification = onCall(async (request) => {
  logger.info("sendReminderNotification v2 (takım) tetiklendi", request.data);

  // --- APP CHECK SİLİNDİ ---

  if (!request.auth) { throw new HttpsError('unauthenticated', 'The function must be called while authenticated.'); }

  const senderId = request.auth.uid;
  const { targetUserId } = request.data || {};

  if (!targetUserId) { throw new HttpsError('invalid-argument', 'Target User ID is required.'); }

  try {
    const targetUserDoc = await db.collection("users").doc(targetUserId).get();
    if (!targetUserDoc.exists) { throw new HttpsError("not-found", "Target user not found."); }
    // --- YENİ KONTROL ---
        const userData = targetUserDoc.data();
        if (!userData) { throw new HttpsError("not-found", "Target user data is empty."); }

        const settings = userData.notification_settings as { teamReminders?: boolean } | null;
        const canReceiveTeamReminder = settings?.teamReminders ?? true; // Varsayılan: açık

        if (!canReceiveTeamReminder) {
          logger.info(`Kullanıcı ${targetUserId} takım hatırlatmalarını kapattı. Bildirim gönderilmedi.`);
          // Kullanıcıya, ayarın kapalı olduğunu bildiren bir hata fırlat
          throw new HttpsError("failed-precondition", "User has disabled team reminders.");
        }
        // --- KONTROL BİTTİ ---

    const fcmToken = userData.fcmToken; // userData'dan al
        if (!fcmToken) {
          logger.warn(`Kullanıcının ${targetUserId} v2 FcmToken'ı yok (takım hatırlatması).`);
          return { status: "no_token", message: "User does not have a token." };
        }

    await sendNotification(
      fcmToken,
      "Your team is calling!",
      `A team member reminded you to start your mining session.`
    );

    logger.info(`Takım bildirimi v2 ${senderId} tarafından ${targetUserId}'a gönderildi.`);
    return { status: "success", message: "Notification sent." };
  } catch (error: any) {
    logger.error("Takım bildirimi v2 gönderirken hata:", error);
    if (error instanceof HttpsError) throw error;
    throw new HttpsError("internal", "An unexpected error occurred.");
  }
});


// 💰 Ödüllü Reklam Bonusunu Talep Etme (claimAdReward - APP CHECK KALDIRILDI)
export const claimAdReward = onCall(async (request) => {
  logger.info("claimAdReward v2 tetiklendi.");

  // --- APP CHECK SİLİNDİ ---

  if (!request.auth) { throw new HttpsError('unauthenticated', 'User must be authenticated.'); }

  const uid = request.auth.uid;
  const userRef = db.collection('users').doc(uid);
  const MAX_ADS_PER_DAY = 10;
  const BOOST_DURATION_MINUTES = 20;
  const BOOST_MULTIPLIER = 1.5;

  try {
    const userDoc = await userRef.get();
    if (!userDoc.exists) { throw new HttpsError('not-found', 'User data not found.'); }
    const userData = userDoc.data();
    if (!userData) throw new HttpsError('not-found', 'User data is empty.');

    if (!userData.is_active) {
        throw new HttpsError('failed-precondition', 'Mining must be active to claim ad reward.');
    }

    let adsWatchedToday = userData.adsWatchedToday || 0;
    const lastAdWatchTimestamp = userData.lastAdWatchTimestamp as admin.firestore.Timestamp | null;
    const now = admin.firestore.Timestamp.now();

    if (lastAdWatchTimestamp && now.toDate().toDateString() !== lastAdWatchTimestamp.toDate().toDateString()) {
      adsWatchedToday = 0;
    }

    if (adsWatchedToday >= MAX_ADS_PER_DAY) {
      throw new HttpsError('resource-exhausted', `Daily ad watch limit (${MAX_ADS_PER_DAY}) reached.`);
    }

    const baseRate = (userData.base_mining_rate as number) || 0;
    const bonusRate = (userData.active_team_bonus_rate as number) || 0;
    const currentEffectiveRate = baseRate + bonusRate;
    const extraMultiplier = BOOST_MULTIPLIER - 1.0;
    const bonusEarned = currentEffectiveRate * extraMultiplier * (BOOST_DURATION_MINUTES / 60.0);

    const currentExpiryTime = (userData.adBoostExpiryTime as admin.firestore.Timestamp | null);
    let newExpiryTime;

    if (!currentExpiryTime || currentExpiryTime.toMillis() < now.toMillis()) {
        newExpiryTime = admin.firestore.Timestamp.fromMillis(now.toMillis() + (BOOST_DURATION_MINUTES * 60 * 1000));
    } else {
        newExpiryTime = admin.firestore.Timestamp.fromMillis(currentExpiryTime.toMillis() + (BOOST_DURATION_MINUTES * 60 * 1000));
    }


    await userRef.update({
      accumulatedAdBonus: admin.firestore.FieldValue.increment(bonusEarned),
      adsWatchedToday: adsWatchedToday + 1,
      lastAdWatchTimestamp: now,
      adBoostExpiryTime: newExpiryTime
    });

    logger.info(`Kullanıcı ${uid}, ${adsWatchedToday + 1}. reklam bonusunu talep etti. Eklenen: ${bonusEarned.toFixed(6)} ON`);

    return { success: true, bonusEarned: bonusEarned, adsWatchedToday: adsWatchedToday + 1 };

  } catch (error: any) {
    logger.error(`Kullanıcı ${uid} reklam bonusu talep hatası:`, error);
    if (error instanceof HttpsError) throw error;
    throw new HttpsError('internal', 'An unexpected error occurred while claiming ad reward.');
  }
});


// --- YENİ ZAMANLANMIŞ FONKSİYON (REKLAM BOOST BİTİŞİ) ---
export const notifyExpiredAdBoosts = onSchedule('every 5 minutes', async (event) => {
    logger.info("notifyExpiredAdBoosts v2 (5dk) cron job tetiklendi.");
    const usersRef = db.collection('users');

    const now = admin.firestore.Timestamp.now();
    const fiveMinutesAgo = admin.firestore.Timestamp.fromMillis(now.toMillis() - FIVE_MINUTES_MS);

    try {
        const snapshot = await usersRef
            .where('adBoostExpiryTime', '<=', now)
            .where('adBoostExpiryTime', '>', fiveMinutesAgo)
            .get();

        if (snapshot.empty) {
            logger.info("Reklam boost süresi dolan kullanıcı v2 bulunamadı.");
            return;
        }

        logger.info(`Reklam boost bildirimi gönderiliyor: ${snapshot.size} kullanıcı...`);

        const notificationPromises: Promise<void>[] = [];

        snapshot.docs.forEach(doc => {
            const userData = doc.data();
            const fcmToken = userData.fcmToken as string | null;
            // --- YENİ KONTROL ---
            const settings = userData.notification_settings as { adBoostReminders?: boolean } | null;
            const canSendAdBoostReminder = settings?.adBoostReminders ?? true; // Varsayılan: açık
            // --- BİTTİ ---

            if (fcmToken && userData.is_active === true && canSendAdBoostReminder) { // <-- GÜNCELLENDİ
                        notificationPromises.push(
                            sendNotification(
                                fcmToken,
                                "Ad Boost Expired",
                                "Your 1.5X Ad Boost has finished. Watch another ad to boost your mining rate again!"
                            )
                        );
                    }
                });

        await Promise.all(notificationPromises);
        logger.info(`${notificationPromises.length} reklam boost bitiş bildirimi v2 gönderildi.`);

    } catch (error) {
        logger.error("notifyExpiredAdBoosts v2 cron hatası:", error);
    }
});




// index.ts DOSYASININ EN SONUNA EKLEYİN

// 🚀 GOOGLE İLE GİRİŞ YAPAN KULLANICILARI YÖNETME FONKSİYONU (GÜNCELLENDİ: Cihaz Kilidi Eklendi)
export const handleGoogleSignIn = onCall(async (request) => {
  logger.info("handleGoogleSignIn v4.0 (Device Lock) tetiklendi", request.data);

  // --- APP CHECK SİLİNDİ ---

  if (!request.auth) {
     throw new HttpsError('unauthenticated', 'User must be authenticated.');
  }

  const uid = request.auth.uid;
  const email = request.auth.token.email;
  let displayName = request.auth.token.name || '';
  const profilePic = request.auth.token.picture || null;
  
  // Device ID alıyoruz
  const deviceId = request.data.deviceId;

  if (!email) {
      throw new HttpsError('invalid-argument', 'Email not found in Google account.');
  }

  const userRef = db.collection('users').doc(uid);
  const userDoc = await userRef.get();

  // 1. DURUM: ESKİ KULLANICI (Daha önce giriş yapmış)
  // BURAYA DOKUNMUYORUZ - Eski kullanıcılar giriş yapabilsin.
  if (userDoc.exists) {
    logger.info(`Returning Google user: ${uid}. Updating last login.`);
    await userRef.update({
        last_login: admin.firestore.FieldValue.serverTimestamp(),
        profileImageUrl: userDoc.data()?.profileImageUrl || profilePic
    });
    return { success: true, message: 'Welcome back.' };
  }

  // 2. DURUM: YENİ KULLANICI (İlk kez kayıt oluyor)
  logger.info(`New Google user: ${uid}. Checking device lock...`);

  // --- CİHAZ KİLİDİ KONTROLÜ (SADECE YENİ KULLANICILAR İÇİN) ---
  if (deviceId) {
      const deviceDoc = await db.collection('device_locks').doc(deviceId).get();
      if (deviceDoc.exists) {
           logger.warn(`Google Hile Girişimi: ${deviceId} cihazı zaten kayıtlı.`);
           // Kullanıcıyı Google Auth'tan da silmemiz lazım çünkü Firebase Auth tarafında oluştu ama biz kabul etmiyoruz.
           try {
             await admin.auth().deleteUser(uid);
             logger.info(`Hileli Google kullanıcısı (${uid}) Auth'tan silindi.`);
           } catch (e) {
             logger.error("Auth kullanıcısı silinirken hata:", e);
           }
           throw new HttpsError('resource-exhausted', 'Bu cihazda zaten bir hesap var. Hile koruması nedeniyle yeni hesap açılamaz.');
      }
  }
  // -----------------------------------------------------------

  try {
    if (displayName.trim().length < 3) {
      const uniquePart = Date.now().toString(36).slice(-4);
      displayName = `User${uniquePart}`;
    }

    // --- CİHAZI KİLİTLE ---
    if (deviceId) {
        await db.collection('device_locks').doc(deviceId).set({
            uid: uid,
            registeredAt: admin.firestore.FieldValue.serverTimestamp()
        });
    }
    // ---------------------

    const userCounterRef = db.collection('app_stats').doc('user_counter');
    const newTotalUsers = await db.runTransaction(async (transaction) => {
      const doc = await transaction.get(userCounterRef);
      const currentTotalUsers = (doc.exists && doc.data()?.total_users) ? doc.data()?.total_users : 0;
      const updatedTotalUsers = currentTotalUsers + 1;
      transaction.set(userCounterRef, { total_users: updatedTotalUsers }, { merge: true });
      return updatedTotalUsers;
    });

    const baseMiningRate = getMiningRateForTotalUsers(newTotalUsers);
    const newUserReferralCode = generateReferralCode();

    const referralCode = request.data.referralCode;
    let referrerUid: string | null = null;
    let hasValidReferrer = false;
    let referrerUpdates = {};
    let referrerData: admin.firestore.DocumentData | null = null;

    if (referralCode) {
      const referrerUserQuery = await db.collection('users').where('referral_code', '==', referralCode).limit(1).get();
      if (!referrerUserQuery.empty) {
        referrerUid = referrerUserQuery.docs[0].id;
        referrerData = referrerUserQuery.docs[0].data();
        hasValidReferrer = true;

        const currentTeamSize = (referrerData.team_members as string[])?.length || 0;
        const newTeamSize = currentTeamSize + 1;
        const newBonusPercentage = getBonusPercentageForTeamSize(newTeamSize);
        let newTier = "Standard";
        if (newTeamSize >= 25) newTier = "Gold";
        else if (newTeamSize >= 10) newTier = "Silver";
        else if (newTeamSize >= 5) newTier = "Bronze";

        referrerUpdates = {
          team_members: admin.firestore.FieldValue.arrayUnion(uid),
          current_bonus_tier: newTier,
          current_bonus_percentage: newBonusPercentage,
        };
      }
    }

    const now = admin.firestore.Timestamp.now();
    const starterBoostExpires = hasValidReferrer
        ? admin.firestore.Timestamp.fromMillis(now.toMillis() + TWENTY_FOUR_HOURS_MS)
        : null;

    // Yeni kullanıcı dökümanı
    await userRef.set({
      username: displayName,
      email: email,
      coin_balance: hasValidReferrer ? 1.0 : 0.0,
      base_mining_rate: baseMiningRate,
      active_team_bonus_rate: 0,
      last_activation_time: null,
      referral_code: newUserReferralCode,
      referred_by: referrerUid,
      team_members: [],
      created_at: now,
      is_active: false,
      profileImageUrl: profilePic,
      last_login: now,
      usernameLastChangedAt: null,
      is_on_starter_boost: hasValidReferrer,
      starter_boost_expires: starterBoostExpires,
      accumulatedAdBonus: 0.0,
      adsWatchedToday: 0,
      lastAdWatchTimestamp: null,
      adBoostExpiryTime: null,
      lastMiningNotificationSentAt: null,
      active_team_member_count: 0,
      current_bonus_tier: "Standard",
      current_bonus_percentage: 0.25,
      notification_settings: {
              miningReminders: true,
              teamReminders: true,
              adBoostReminders: true,
            },
      has_completed_onboarding: false,
      deviceId: deviceId || null, // ID'yi de kaydedelim
    });

    if (referrerUid && referrerData) {
        const batch = db.batch();
        batch.update(db.collection('users').doc(referrerUid), referrerUpdates);
        batch.set(db.collection('users').doc(referrerUid).collection('team_members_cache').doc(uid), {
            username: displayName,
            profileImageUrl: profilePic,
            is_active: false,
            handle: `@${newUserReferralCode}`
        });
        batch.set(db.collection('users').doc(uid).collection('team_members_cache').doc(referrerUid), {
            username: referrerData.username ?? "Referrer",
            profileImageUrl: referrerData.profileImageUrl ?? null,
            is_active: referrerData.is_active ?? false,
            handle: `@${referrerData.referral_code ?? 'CODE'}`
        });
        await batch.commit();
    }

    logger.info(`New Google user registered v4.0: ${uid}`);
    return { success: true, message: 'User registered successfully.' };

  } catch (error: any) {
    logger.error('Google Sign-In v4.0 hatası:', error);
    if (error instanceof HttpsError) throw error;
    throw new HttpsError('internal', error.message || 'An unknown error occurred during Google Sign-In.');
  }
});

// index.ts DOSYASININ EN SONUNA EKLEYİN

/**
 * Bir kullanıcıyı adminlere bildirmek için çağrılır (UGC politikası).
 * Bildirimleri 'reports' adında yeni bir koleksiyona kaydeder.
 */
export const reportUser = onCall(async (request) => {
  logger.info("reportUser v1.0 (UGC) tetiklendi", request.data);

  // --- APP CHECK SİLİNDİ ---

  // --- DÜZELTME: EKSİK AUTH KONTROLÜ EKLENDİ ---
  if (!request.auth) {
    logger.error("reportUser çağrısında kimlik doğrulaması eksik.");
    throw new HttpsError('unauthenticated', 'User must be authenticated.');
  }
  // --- DÜZELTME BİTTİ ---

  const reporterUid = request.auth.uid; // Şikayet eden
  const { reportedUserId, reason } = request.data; // Şikayet edilen

  if (!reportedUserId || !reason) {
    throw new HttpsError('invalid-argument', 'reportedUserId and reason are required.');
  }

  // Kendini bildirmeyi engelle
  if (reporterUid === reportedUserId) {
    throw new HttpsError('failed-precondition', 'You cannot report yourself.');
  }

  try {
    // Adminlerin incelemesi için 'reports' koleksiyonuna yeni bir belge ekle
    await db.collection('reports').add({
      reporterUid: reporterUid,
      reportedUserId: reportedUserId,
      reason: reason,
      timestamp: admin.firestore.FieldValue.serverTimestamp(),
      status: 'pending', // (Durum: incelenmeyi bekliyor)
    });

    logger.info(`Kullanıcı ${reporterUid}, ${reportedUserId} kullanıcısını "${reason}" sebebiyle bildirdi.`);
    return { success: true, message: 'User reported successfully.' };

  } catch (error: any) {
    logger.error(`reportUser v1.0 hatası:`, error);
    throw new HttpsError('internal', 'An unexpected error occurred while reporting user.');
  }
});

// index.ts DOSYASININ EN SONUNA EKLEYİN

/**
 * Kullanıcının hesabını ve ilişkili tüm verilerini kalıcı olarak siler.
 * (Auth, Firestore dökümanı, Storage dosyaları ve tüm cache kayıtları)
 */
export const deleteUserAccount = onCall(async (request) => {
  logger.info("deleteUserAccount v1.0 (Veri Güvenliği) tetiklendi.");

  // --- APP CHECK SİLİNDİ ---

  // --- DÜZELTME: EKSİK AUTH KONTROLÜ EKLENDİ ---
  if (!request.auth) {
    logger.error("deleteUserAccount çağrısında kimlik doğrulaması eksik.");
    throw new HttpsError('unauthenticated', 'User must be authenticated.');
  }
  // --- DÜZELTME BİTTİ ---

  const uid = request.auth.uid;
  const userRef = db.collection('users').doc(uid);
  const storage = admin.storage().bucket(); // Varsayılan bucket

  try {
    const userDoc = await userRef.get();
    if (!userDoc.exists) {
      logger.warn(`Kullanıcı ${uid} silinmek istendi ama Firestore dökümanı bulunamadı.`);
      // Döküman olmasa bile Auth kaydını silmeyi dene
      await admin.auth().deleteUser(uid);
      logger.info(`Kullanıcı ${uid} için Auth kaydı (sadece) silindi.`);
      return { success: true, message: 'Account data already partially deleted. Auth record cleaned up.' };
    }

    const userData = userDoc.data()!;
    const referrerUid = userData.referred_by as string | null;
    const teamMembers = userData.team_members as string[] | null;

    // 1. Silme işlemi için bir Batch başlat
    const batch = db.batch();

    // 2. Kullanıcının PATRONUNUN cache'inden bu kullanıcıyı sil
    if (referrerUid) {
      const referrerCacheRef = db.collection('users').doc(referrerUid)
                                 .collection('team_members_cache').doc(uid);
      batch.delete(referrerCacheRef);

      // Ayrıca patronun takım sayısını ve bonusunu yeniden hesaplaması için işaretle
      // (Şimdilik sadece cache'i siliyoruz, bir sonraki 'activateMining'de bonusu düşecektir)
       batch.update(db.collection('users').doc(referrerUid), {
           team_members: admin.firestore.FieldValue.arrayRemove(uid)
       });
    }

    // 3. Kullanıcının KENDİ TAKIMININ cache'inden bu kullanıcıyı (patron olarak) sil
    if (teamMembers && teamMembers.length > 0) {
      teamMembers.forEach(memberId => {
        const memberCacheRef = db.collection('users').doc(memberId)
                                 .collection('team_members_cache').doc(uid);
        batch.delete(memberCacheRef);
        // Ayrıca takım üyesinin "referred_by" alanını null yap
        batch.update(db.collection('users').doc(memberId), {
            referred_by: null
        });
      });
    }

    // 4. Kullanıcının profil resimlerini Storage'dan sil
    // (Klasör silme işlemi için `deleteFiles` kullanılır)
    const profileImagesFolder = `profile_images/${uid}`;
    await storage.deleteFiles({ prefix: profileImagesFolder });
    logger.info(`Kullanıcı ${uid} için Storage dosyaları (${profileImagesFolder}) silindi.`);


    // 5. Ana Kullanıcı Dökümanını sil
    batch.delete(userRef);

    // 6. Toplu işlemleri gerçekleştir
    await batch.commit();
    logger.info(`Kullanıcı ${uid} için Firestore dökümanı ve tüm cache kayıtları silindi.`);

    // 7. Son olarak, Firebase Auth kaydını sil
    await admin.auth().deleteUser(uid);
    logger.info(`Kullanıcı ${uid} için Auth kaydı başarıyla silindi. İşlem tamamlandı.`);

    return { success: true, message: 'Account deleted successfully.' };

  } catch (error: any) {
    logger.error(`deleteUserAccount v1.0 hatası (Kullanıcı: ${uid}):`, error);
    if (error.code === 'auth/user-not-found') {
       return { success: true, message: 'User already deleted.' };
    }
    throw new HttpsError('internal', 'An unexpected error occurred while deleting the account.');
  }
});

// === YENİ BİRLEŞTİRİLMİŞ FONKSİYON (MALİYET OPTİMİZASYONU) ===
// Bu fonksiyon, silinen 'deactivateMining' VE 'propagateProfileUpdatesToCache'
// fonksiyonlarının yerine geçer ve 16,000+ isteği 8,000~'e düşürür.

export const onUserDocumentUpdateHandler = onDocumentUpdated("users/{userId}", async (event) => {
    if (!event.data) {
        logger.info("onUserDocumentUpdateHandler event data eksik!");
        return;
    }

    const beforeData = event.data.before.data();
    const afterData = event.data.after.data();
    const userId = event.params.userId;

    // --- 1. 'deactivateMining' MANTIĞI ---
    // Kullanıcı pasif duruma geçti mi? (is_active: true -> false)
    const becameInactive = (beforeData.is_active === true) && (afterData.is_active === false);

    if (becameInactive) {
        logger.info(`Kullanıcı ${userId} pasifleşti, global sayaç düşürülüyor...`);
        try {
            const appStatsRef = db.collection('app_stats').doc('global_counter');
            await appStatsRef.set({
                total_active_miners: admin.firestore.FieldValue.increment(-1)
            }, { merge: true });
            logger.info(`Global sayaç ${userId} için düşürüldü.`);
        } catch (error) {
            logger.error(`Global sayaç düşürme hatası (Kullanıcı: ${userId}):`, error);
        }
    }

    // --- 2. 'propagateProfileUpdatesToCache' MANTIĞI ---
    // Kullanıcının profili (isim veya resim) değişti mi?
    const profileChanged = (beforeData.username !== afterData.username) ||
                         (beforeData.profileImageUrl !== afterData.profileImageUrl);

    if (profileChanged) {
        logger.info(`Profil değişti ${userId}, cache'e yansıtılıyor...`);

        // 2a. Değişikliği Patrona Yansıt
        const referrerUid = afterData.referred_by as string | null;
        if (referrerUid) {
            try {
                const cacheRef = db.collection('users')
                                   .doc(referrerUid) // Patronun dökümanı
                                   .collection('team_members_cache')
                                   .doc(userId); // Değişen kullanıcının kaydı

                // Profil güncellemesini cache'e yaz
                await cacheRef.update({
                    username: afterData.username,
                    profileImageUrl: afterData.profileImageUrl
                });
                logger.info(`Cache (Referans: ${referrerUid}) ${userId} için başarıyla güncellendi.`);
            } catch (error) {
                 // Hata olabilir (örn. cache dökümanı yoksa), ama akışı durdurmamalı
                 logger.warn(`Kullanıcı ${userId} için (Referans) cache güncelleme hatası (örn. cache yok):`, error);
            }
        }

        // 2b. Değişikliği Kendi Takımına Yansıt
        const teamMembers = afterData.team_members as string[] | null;
        if (teamMembers && teamMembers.length > 0) {
            logger.info(`Güncelleme, ${teamMembers.length} takım üyesinin cache'ine de yansıtılıyor...`);
            try {
                const batch = db.batch();
                teamMembers.forEach(memberId => {
                    const memberCacheRef = db.collection('users')
                                             .doc(memberId) // Takım üyesinin dökümanı
                                             .collection('team_members_cache')
                                             .doc(userId); // Değişen kullanıcının kaydı

                    batch.update(memberCacheRef, {
                        username: afterData.username,
                        profileImageUrl: afterData.profileImageUrl
                    });
                });
                await batch.commit();
                logger.info(`Takım üyelerinin cache'leri (${userId} için) başarıyla güncellendi.`);
            } catch (error) {
                 logger.error(`Kullanıcı ${userId} için (Takım Üyeleri) cache güncelleme hatası:`, error);
            }
        }
    }

    // Eğer 'becameInactive' veya 'profileChanged' değilse (örn. sadece adBoostExpiryTime değiştiyse)
    // fonksiyon hiçbir şey yapmadan, maliyetsizce kapanır.
    return;
});