// lib/main.dart (EKSİK IMPORT EKLENDİ)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:on_network/core/providers/localization_provider.dart';
import 'package:on_network/firebase_options.dart';
import 'package:on_network/features/auth/view/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// --- Firebase servisleri ---
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:on_network/core/services/notification_service.dart';
//import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// --- YENİ IMPORT (APP OPEN AD İÇİN) ---
import 'package:on_network/core/services/ad_service.dart'; // <-- HATA BURADAYDI, EKLENDİ
// --- BİTTİ ---

// --- LOKALİZASYON ---
import 'package:on_network/generated/l10n/app_localizations.dart';
// --- BİTTİ ---

// Diğer gerekli paketler
import 'dart:ui';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show UncontrolledProviderScope;

late ProviderContainer providerContainer;

/// 🔹 Arka planda (terminated) gelen mesajları işler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint("📩 Arka planda mesaj işlendi: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // --- .env dosyasını yükle ---
  try {
    await dotenv.load(fileName: ".env");
    debugPrint(".env dosyası başarıyla yüklendi.");
  } catch (e) {
    debugPrint("Hata: .env dosyası yüklenemedi. $e");
  }

  // --- Firebase başlat ---
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    debugPrint("Firebase zaten başlatılmış, sorun yok: $e");
  }

  // --- Firestore offline desteği ---
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  // --- Crashlytics & Analytics ---
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  FirebaseAnalytics.instance.logAppOpen();

  // --- Mobil reklamlar ve bildirimler ---
  MobileAds.instance.initialize();
  NotificationService.initializeLocalNotifications();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // --- Intl ve tarih formatlaması ---
  await initializeDateFormatting(null, null);

  // --- Sistem UI ---
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xFF1A1A2E),
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // --- Uygulama başlat ---
  providerContainer = ProviderContainer();

  runApp(UncontrolledProviderScope(container: providerContainer, child: const MyApp()));
}


class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}


class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      print("Uygulama devam ettirildi (resumed). App Open Ad gösteriliyor...");
      // HATA DÜZELTİLDİ: appOpenAdProvider artık import edildi
      providerContainer.read(appOpenAdProvider).showAdIfReady();
    }
  }


  @override
  Widget build(BuildContext context) {
    // Dil provider'ını burada izliyoruz.
    final locale = ref.watch(localeProvider);

    return MaterialApp(
      title: 'ON Network',
      debugShowCheckedModeBanner: false,
      locale: locale,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0D0D2E),
        cardColor: const Color(0xFF1A1A2E),
        primaryColor: const Color(0xFF00D1FF),
        hintColor: Colors.white.withOpacity(0.6),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(color: Colors.white70),
          bodySmall: TextStyle(color: Colors.white54),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00D1FF),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF282844),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF00D1FF),
              width: 2,
            ),
          ),
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white54),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // GÜNCELLENDİ: 13 DİLİN TAMAMI
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('tr', ''), // Turkish
        Locale('id', ''), // Indonesian
        Locale('vi', ''), // Vietnamese
        Locale('es', ''), // Spanish
        Locale('hi', ''), // Hindi
        Locale('pt', ''), // Portuguese
        Locale('ar', ''), // Arabic
        Locale('ru', ''), // Russian
        Locale('de', ''), // German
        Locale('fr', ''), // French
        Locale('ja', ''), // Japanese
        Locale('ko', ''), // Korean
      ],
      home: const SplashScreen(),
    );
  }
}