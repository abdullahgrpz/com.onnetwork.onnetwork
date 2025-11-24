// lib/core/services/notification_service.dart (ÇÖKME 2 VE 3 DÜZELTİLDİ)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart'; // YENİ: debugPrint için eklendi

// --- YENİ IMPORTLAR ---
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart'; // ARTIK GEREKLİ DEĞİL
// import 'package:on_network/navigation_shell.dart'; // ARTIK GEREKLİ DEĞİL
// import 'package:on_network/main.dart'; // ARTIK GEREKLİ DEĞİL
// --- BİTTİ ---

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // --- YENİ: Yerel Bildirimler ve Android Kanalı ---
  static final FlutterLocalNotificationsPlugin _localNotifications =
  FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'default', // BU ID, index.ts'teki 'channelId' ile AYNI OLMALI
    'ON Network Notifications', // Kullanıcının göreceği kanal adı
    description: 'Mining reminders and app notifications.', // Kanal açıklaması
    importance: Importance.max, // Bildirimin görünür olması için Yüksek
    playSound: true,
  );
  // --- BİTTİ ---

  // main.dart'tan çağrılacak statik başlatıcı
  static Future<void> initializeLocalNotifications() async {
    // Android kanalını oluştur
    await _localNotifications
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    // iOS için ön plan ayarları (uygulama açıkken bildirim göster)
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Yerel bildirim eklentisini başlat (şimdilik tıklama eylemi yok)
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'), // Varsayılan uygulama ikonu
      iOS: DarwinInitializationSettings(),
    );
    await _localNotifications.initialize(initializationSettings);
  }


  // AuthWrapper'dan çağrılan asıl fonksiyon
  Future<void> initNotifications() async {
    // 1. Kullanıcıdan bildirim izni iste
    await _fcm.requestPermission();

    // 2. Cihazın özel token'ını al
    final fcmToken = await _fcm.getToken();
    debugPrint("FCM Token: $fcmToken");

    // 3. Token'ı Firestore'a kaydet (Bu kısım aynı)
    if (fcmToken != null) {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set(
          {'fcmToken': fcmToken},
          SetOptions(merge: true), // Diğer verileri ezmeden ekle
        );
      }
    }

    // --- YENİ: Bildirim Dinleyicileri ---

    // 4. Uygulama AÇIKKEN (Foreground) gelen mesajları dinle
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('FOREGROUND MESAJI GELDİ:');
      debugPrint(message.notification?.title);
      debugPrint(message.notification?.body);

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // Eğer bildirim ve android kanalı varsa, yerel bildirimi tetikle
      if (notification != null && android != null) {

        // --- ÇÖKME 2 DÜZELTMESİ (try-catch bloğu) ---
        try {
          _localNotifications.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                _channel.id, // Kanal ID'si
                _channel.name,
                channelDescription: _channel.description,
                importance: Importance.max,
                priority: Priority.high,
                playSound: true,
                icon: '@mipmap/ic_launcher', // Varsayılan uygulama ikonu
              ),
            ),
          );
        } catch (e) {
          // IOException veya benzeri bir hata olursa yakala ve sadece logla
          debugPrint("Yerel bildirim gösterilirken hata oluştu (ÇÖKME 2 ÖNLENDİ): $e");
        }
        // --- DÜZELTME BİTTİ ---
      }
    });

    // 5. Uygulama ARKA PLANDA AÇIKKEN (Background) bildirime tıklamayı dinle
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('BİLDİRİME TIKLANDI (Background/Terminated):');
      debugPrint(message.data.toString());

      // --- ÇÖKME 3 DÜZELTMESİ (Komple kaldırıldı) ---
      // Arka plandayken provider'ı okumak "Bad State" hatasına (ref disposed) neden oluyor.
      // Bu işi zaten splash_screen.dart içindeki _setupTerminatedNotificationHandler
      // ve main.dart içindeki didChangeAppLifecycleState yönetiyor.
      // Bu dinleyici içinden navigasyon yapmaya çalışmak tehlikeli ve gereksiz.

      // if (message.data['screen'] == 'HOME_SCREEN') {
      //   providerContainer.read(navigationShellIndexProvider.notifier).state = 0; // <-- BU SATIR ÇÖKMEYE NEDEN OLUYORDU
      //   print('Ana ekrana yönlendirildi.');
      // }
      // --- DÜZELTME BİTTİ ---
    });
    // --- YENİ DİNLEYİCİLER BİTTİ ---
  }
}