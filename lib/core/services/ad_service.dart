// lib/core/services/ad_service.dart (ÇÖKME 1 DÜZELTİLDİ)
import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart'; // <-- ValueNotifier İÇİN GEREKLİ

// === ÖDÜLLÜ REKLAM (REWARDED AD) ID'LERİ ===
final String _rewardedAdUnitId = Platform.isAndroid
    ? 'ca-app-pub-8200756642749372/7839409294' // Android (Mevcut)
    : 'ca-app-pub-8200756642749372/6526327623'; // iOS (Mevcut)


// === BANNER REKLAM ID'LERİ ===
final String _bannerAdUnitId = Platform.isAndroid
    ? 'ca-app-pub-8200756642749372/8748561044' // <-- Gerçek ID
    : 'ca-app-pub-8200756642749372/2349478110'; // <-- ⚠️ PATRON: Burası iOS Banner ID (Gerçeğiyle değiş)


// === UYGULAMA AÇILIŞ (APP OPEN) ID'LERİ ===
final String _appOpenAdUnitId = Platform.isAndroid
    ? 'ca-app-pub-8200756642749372/1039685318' // <-- ⚠️ PATRON: Burası Android Gerçek ID
    : 'ca-app-pub-8200756642749372/6999277362'; // <-- ⚠️ PATRON: Burası iOS Gerçek ID


class AdService {
  RewardedAd? _rewardedAd;
  bool _isRewardedAdReady = false;
  bool _isLoadingAd = false;
  int _retryCount = 0;
  Timer? _retryTimer;

  void loadRewardedAd() {
    if (_rewardedAd != null || _isRewardedAdReady || _isLoadingAd) {
      print("Ödüllü reklam zaten hazır veya yükleniyor.");
      return;
    }
    print("Ödüllü reklam yükleniyor... (Deneme: $_retryCount)");
    _isLoadingAd = true;
    RewardedAd.load(
      adUnitId: _rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('$ad yüklendi.');
          _rewardedAd = ad;
          _isRewardedAdReady = true;
          _isLoadingAd = false;
          _retryCount = 0;
          _retryTimer?.cancel();
          _setFullScreenContentCallback();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('RewardedAd yüklenemedi: $error');
          _rewardedAd = null;
          _isRewardedAdReady = false;
          _isLoadingAd = false;
          _scheduleAdRetry();
        },
      ),
    );
  }

  void _scheduleAdRetry() {
    _retryTimer?.cancel();
    _retryCount++;
    final int delaySeconds = min( (pow(2, _retryCount) * 10).toInt(), 180 );
    print("Reklam yüklemesi başarısız. ${delaySeconds} saniye sonra tekrar denenecek...");
    _retryTimer = Timer(Duration(seconds: delaySeconds), () {
      loadRewardedAd();
    });
  }

  bool get isRewardedAdReady => _isRewardedAdReady;

  // --- BU FONKSİYON GÜNCELLENDİ (ÇÖKME DÜZELTMESİ) ---
  void showRewardedAd(
      WidgetRef ref,
      BuildContext context,
      VoidCallback? onSuccess
      ) {

    // --- ÇÖKME 1 DÜZELTMESİ (RACE CONDITION) ---
    // 1. Reklamı önce yerel bir değişkene ata (Yarış durumunu engelle)
    final adToShow = _rewardedAd;

    // 2. Kontrolü bu yerel değişken üzerinden yap
    if (adToShow == null || !_isRewardedAdReady) {
      // --- DÜZELTME BİTTİ ---

      print('Uyarı: Ödüllü reklam henüz hazır değil.');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ad not ready yet. Please try again shortly.'), duration: Duration(seconds: 2))
      );
      if (!_isLoadingAd) {
        loadRewardedAd();
      }
      return;
    }

    // final RewardedAd adToShow = _rewardedAd!; // <-- ESKİ SORUNLU KOD (SİLİNDİ)

    print("Ödüllü reklam gösteriliyor...");

    // 'adToShow' değişkenini kullanarak göster
    adToShow.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) async {
      print('$ad ile ödül kazanıldı: miktar ${reward.amount}, tip ${reward.type}');
      try {
        final functions = FirebaseFunctions.instance;
        final callable = functions.httpsCallable('claimAdReward');
        final result = await callable.call();
        print('claimAdReward sonucu: ${result.data}');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Boost activated! +${(result.data['bonusEarned'] as num?)?.toStringAsFixed(4) ?? '...'} ON added to next payout.'),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3)
            )
        );
        onSuccess?.call();
      } on FirebaseFunctionsException catch (e) {
        print("claimAdReward hatası: ${e.code} - ${e.message}");
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error claiming reward: ${e.message}'), backgroundColor: Colors.red)
        );
      } catch (e) {
        print("claimAdReward bilinmeyen hata: $e");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('An unexpected error occurred while claiming reward.'), backgroundColor: Colors.red)
        );
      }
    });
  }
  // --- GÜNCELLEME BİTTİ ---

  void _setFullScreenContentCallback() {
    _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('$ad tam ekran gösterildi.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad kapatıldı.');
        ad.dispose();
        _rewardedAd = null;
        _isRewardedAdReady = false;
        _retryCount = 0;
        Future.delayed(const Duration(seconds: 2), () {
          print("Reklam kapatıldıktan 2sn sonra yenisi yükleniyor...");
          loadRewardedAd();
        });
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad gösterilemedi: $error');
        ad.dispose();
        _rewardedAd = null;
        _isRewardedAdReady = false;
        _retryCount = 0;
        Future.delayed(const Duration(seconds: 2), () {
          print("Reklam gösterilemedikten 2sn sonra yenisi yükleniyor...");
          loadRewardedAd();
        });
      },
      onAdImpression: (RewardedAd ad) => print('$ad gösterimi kaydedildi'),
    );
  }

  void dispose() {
    _rewardedAd?.dispose();
    _retryTimer?.cancel();
  }
}

// === ÖDÜLLÜ REKLAM PROVIDER'I (Mevcut) ===
final adServiceProvider = Provider<AdService>((ref) {
  final adService = AdService();
  adService.loadRewardedAd();
  ref.onDispose(() => adService.dispose());
  return adService;
});

// === BANNER REKLAM PROVIDER'I (Mevcut) ===
final bannerAdProvider = FutureProvider.autoDispose<BannerAd>((ref) async {
  final ad = BannerAd(
    adUnitId: _bannerAdUnitId,
    size: AdSize.banner,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (Ad ad) {
        print('Banner Ad yüklendi.');
      },
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print('Banner Ad yüklenemedi: $error');
        ad.dispose();
      },
    ),
  );
  await ad.load();
  ref.onDispose(() => ad.dispose());
  return ad;
});

// === UYGULAMA AÇILIŞ REKLAMI (APP OPEN AD) YÖNETİCİSİ (GÜNCELLENDİ) ===
class AppOpenAdManager {
  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;
  bool _isLoadingAd = false;
  int _appOpenRetryCount = 0;
  Timer? _appOpenAdRetryTimer;

  static DateTime _lastAdShowTime = DateTime.now();
  static bool _isFirstLaunch = true;

  // --- YENİ SİNYALCİ: Reklamın hazır (veya başarısız) olduğunu bildirir ---
  final ValueNotifier<bool> isAdReadyForSplash = ValueNotifier(false);
  // --- BİTTİ ---

  // Yükleme fonksiyonu (GÜNCELLENDİ)
  void loadAd() {
    if (_appOpenAd != null || _isLoadingAd) {
      print("App Open Ad zaten hazır veya yükleniyor.");
      return;
    }
    print("App Open Ad yükleniyor... (Deneme: $_appOpenRetryCount)");
    _isLoadingAd = true;

    // --- YENİ: Splash ekranının beklemede olduğunu bildir ---
    isAdReadyForSplash.value = false;
    // --- BİTTİ ---

    AppOpenAd.load(
      adUnitId: _appOpenAdUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          print("App Open Ad yüklendi.");
          _appOpenAd = ad;
          _isLoadingAd = false;
          _appOpenRetryCount = 0;
          _appOpenAdRetryTimer?.cancel();
          // --- YENİ: Splash ekranına "Hazırım" sinyali gönder ---
          isAdReadyForSplash.value = true;
          // --- BİTTİ ---
        },
        onAdFailedToLoad: (error) {
          print('App Open Ad yüklenemedi: $error');
          _isLoadingAd = false;
          _appOpenAd = null;
          _scheduleAppOpenAdRetry();
          // --- YENİ: Splash ekranına "Başarısız oldum, sen devam et" sinyali gönder ---
          isAdReadyForSplash.value = true; // Hata olsa bile akışı açıyoruz
          // --- BİTTİ ---
        },
      ),
    );
  }

  // Yeniden deneme zamanlayıcısı (Mevcut)
  void _scheduleAppOpenAdRetry() {
    _appOpenAdRetryTimer?.cancel();
    _appOpenRetryCount++;
    final int delaySeconds = min( (pow(2, _appOpenRetryCount) * 10).toInt(), 180 );
    print("App Open Ad yüklemesi başarısız. ${delaySeconds} saniye sonra tekrar denenecek...");
    _appOpenAdRetryTimer = Timer(Duration(seconds: delaySeconds), () {
      loadAd();
    });
  }

  // Gösterme fonksiyonu (Mevcut)
  void showAdIfReady() {
    if (_appOpenAd == null) {
      print("App Open Ad hazır değil, gösterilemiyor.");
      if (!_isLoadingAd) {
        loadAd();
      }
      return;
    }

    if (_isShowingAd) {
      print("Başka bir reklam zaten gösterimde.");
      return;
    }

    if (!_isFirstLaunch) {
      if (DateTime.now().difference(_lastAdShowTime) < const Duration(seconds: 30)) {
        print("App Open Ad spam engellemesine takıldı. (30sn bekle)");
        return;
      }
    }

    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        print("App Open Ad gösterildi.");
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('App Open Ad gösterilemedi: $error');
        _isShowingAd = false;
        _isFirstLaunch = false;
        ad.dispose();
        _appOpenAd = null;
        loadAd();
      },
      onAdDismissedFullScreenContent: (ad) {
        print("App Open Ad kapatıldı.");
        _isShowingAd = false;
        _lastAdShowTime = DateTime.now();
        _isFirstLaunch = false;
        ad.dispose();
        _appOpenAd = null;
        loadAd();
      },
    );

    _appOpenAd!.show();
  }
}

// === APP OPEN REKLAM PROVIDER'I (Mevcut) ===
final appOpenAdProvider = Provider<AppOpenAdManager>((ref) {
  final manager = AppOpenAdManager();
  manager.loadAd();
  ref.onDispose(() {
    manager._appOpenAdRetryTimer?.cancel();
    manager._appOpenAd?.dispose();
    manager.isAdReadyForSplash.dispose();
  });
  return manager;
});