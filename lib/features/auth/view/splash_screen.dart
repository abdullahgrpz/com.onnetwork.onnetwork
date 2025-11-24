// lib/features/auth/view/splash_screen.dart (EKSİK IMPORTLAR EKLENDİ + 'ref' KULLANILDI)

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:on_network/features/auth/view/auth_wrapper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_network/navigation_shell.dart';
import 'package:on_network/core/services/ad_service.dart';

// --- YENİ IMPORTLAR (ZORUNLU GÜNCELLEME İÇİN) ---
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
// --- BİTTİ ---

// --- LOKALİZASYON ---
import 'package:on_network/generated/l10n/app_localizations.dart';
// --- BİTTİ ---

// --- HATA DÜZELTMELERİ İÇİN IMPORTLAR ---
import 'package:on_network/core/providers/localization_provider.dart'; // HATA 2 İÇİN EKLENDİ
import 'package:on_network/generated/l10n/app_localizations_en.dart'; // HATA 4 İÇİN EKLENDİ
// --- BİTTİ ---


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  bool _hasNavigated = false;
  Timer? _maxWaitTimer;

  AppOpenAdManager? _adManager;
  late final VoidCallback _adListener;


  Future<void> _setupTerminatedNotificationHandler() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print('Uygulama KAPALIYKEN bildirime tıklandı:');
      print(initialMessage.data);

      if (initialMessage.data['screen'] == 'HOME_SCREEN') {
        ref.read(navigationShellIndexProvider.notifier).state = 0;
      }
    }
  }

  Future<bool> _initializeRemoteConfig() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      await remoteConfig.setDefaults(const {
        "min_required_build_number": 8,
      });
      await remoteConfig.fetchAndActivate();
      debugPrint("SplashScreen: Remote Config başlatıldı ve ayarlar çekildi.");
      return true;
    } catch (e) {
      debugPrint("SplashScreen: Remote Config başlatılamadı: $e");
      return false;
    }
  }

  Future<bool> _checkVersion() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      final int requiredBuildNumber = remoteConfig.getInt('min_required_build_number');
      final PackageInfo info = await PackageInfo.fromPlatform();
      final int currentBuildNumber = int.parse(info.buildNumber);

      print('Versiyon Kontrol: Gerekli (Sunucu): $requiredBuildNumber, Mevcut (Cihaz): $currentBuildNumber');

      if (currentBuildNumber < requiredBuildNumber) {
        if (mounted) {
          _showUpdateDialog();
        }
        return true;
      }
      return false;

    } catch (e) {
      print("Versiyon kontrol hatası: $e");
      return false;
    }
  }

  void _showUpdateDialog() {
    // --- HATA DÜZELTMESİ (HATA 1, 2, 3, 4) ---
    // 'providerContainer' yerine 'ref' kullanıldı.
    // 'localeProvider' ve 'AppLocalizationsEn' artık import edildi.
    final l10nState = ref.read(localeProvider.notifier).state;

    // AppLocalizations.of(context) burada güvenli olmayabilir (context tam hazır değilse).
    // Bu yüzden ya 'AppLocalizationsEn()' kullanırız ya da l10nState'i deneriz.
    // 'l10nState' null ise (sistem dili), varsayılan olarak İngilizce metinleri gösteririz.
    final localizations = l10nState == null
        ? AppLocalizationsEn()
        : (AppLocalizations.of(context) ?? AppLocalizationsEn()); // Güvenli fallback
    // --- DÜZELTME BİTTİ ---

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Theme.of(context).cardColor,
            title: Text(
                localizations.updateRequiredTitle,
                style: const TextStyle(color: Colors.white)
            ),
            content: Text(
              localizations.updateRequiredMessage,
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D1FF),
                ),
                child: Text(
                    localizations.updateNowButton,
                    style: const TextStyle(color: Colors.white)
                ),
                onPressed: _launchStore,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _launchStore() async {
    String urlString = 'https://play.google.com/store/apps/details?id=com.onnetwork.on_network';
    if (Platform.isIOS) {
      urlString = 'https://apps.apple.com/app/idYOUR_APP_ID'; // DEĞİŞTİR
    }

    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $urlString';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error launching store: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _initAdAndNavigation() async {

    // --- 1. ADIM: REMOTE CONFIG'İ YÜKLE ---
    await _initializeRemoteConfig();
    if (!mounted) return;

    // --- 2. ADIM: VERSİYONU KONTROL ET ---
    bool needsUpdate = await _checkVersion();
    if (needsUpdate) {
      print("Güncelleme gerekli. Splash ekranı durduruluyor.");
      return;
    }
    if (!mounted) return;

    // --- 3. ADIM: GÜNCELLEME GEREKMİYORSA, REKLAM VE NAVİGASYONA DEVAM ET ---
    print("Güncelleme gerekmiyor. Normal uygulama akışı başlıyor.");
    _setupTerminatedNotificationHandler();

    _adManager = ref.read(appOpenAdProvider);
    _adListener = _navigate;

    _adManager!.isAdReadyForSplash.addListener(_adListener);

    _maxWaitTimer = Timer(const Duration(seconds: 10), () {
      print("Maksimum bekleme süresi (10sn) doldu. Navigasyon yapılıyor.");
      _navigate();
    });
  }

  void _navigate() {
    if (_hasNavigated) return;
    if (!mounted) return;

    _hasNavigated = true;

    _adManager?.isAdReadyForSplash.removeListener(_adListener);
    _maxWaitTimer?.cancel();

    print("Navigasyon tetiklendi. App Open Ad (Cold Start) gösteriliyor...");
    _adManager?.showAdIfReady();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const AuthWrapper()),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initAdAndNavigation();
    });
  }

  @override
  void dispose() {
    _maxWaitTimer?.cancel();
    _adManager?.isAdReadyForSplash.removeListener(_adListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D2E),
      body: Image.asset(
        'assets/images/splash_animation.gif',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}