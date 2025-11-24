// lib/features/auth/view/auth_wrapper.dart (GÜNCELLENDİ - BASİTLEŞTİRİLDİ)

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_network/core/services/notification_service.dart';
import 'package:on_network/features/auth/view/login_screen.dart';
// import 'package:on_network/features/auth/view/onboarding_screen.dart'; // ARTIK GEREKLİ DEĞİL
// import 'package:on_network/navigation_shell.dart'; // ARTIK GEREKLİ DEĞİL
// import 'package:cloud_firestore/cloud_firestore.dart'; // ARTIK GEREKLİ DEĞİL

import '../../../app_wrapper.dart'; // YENİ AppWrapper'ı import et

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Sadece auth durumunu dinle
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, authSnapshot) {

        if (authSnapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              backgroundColor: Color(0xFF0D0D2E),
              body: Center(child: CircularProgressIndicator(color: Color(0xFF00D1FF)))
          );
        }

        if (authSnapshot.hasData) {
          // Kullanıcı giriş yapmış.
          final user = authSnapshot.data!;
          // Bildirim servisini burada başlat (bu doğru)
          NotificationService().initNotifications(); // <-- DÜZELTİLDİ

          // --- DEĞİŞİKLİK BURADA ---
          // Veri okumayı ve yönlendirmeyi FutureBuilder yerine
          // yeni AppWrapper'ımıza devret.
          return const AppWrapper();
          // --- DEĞİŞİKLİK BİTTİ ---

        }

        // Kullanıcı giriş yapmamış: Giriş Ekranına git
        return const LoginScreen();
      },
    );
  }
}