// lib/app_wrapper.dart (YENİ DOSYA)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_network/features/auth/view/onboarding_screen.dart';
import 'package:on_network/features/home/providers/home_providers.dart'; // userDataStreamProvider burada
import 'package:on_network/navigation_shell.dart';

class AppWrapper extends ConsumerWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Kullanıcı verisini SADECE BURADA, BİR KEZ dinle
    final asyncUserData = ref.watch(userDataStreamProvider);

    return asyncUserData.when(
      loading: () {
        // Bu, uygulamanın ana yükleme ekranı olacak
        // (İstersek buraya HomeScreenSkeleton da koyabiliriz)
        return const Scaffold(
          backgroundColor: Color(0xFF0D0D2E),
          body: Center(child: CircularProgressIndicator(color: Color(0xFF00D1FF))),
        );
      },
      error: (err, stack) {
        // Stream hatası olursa (örn: internet yok)
        return Scaffold(
          backgroundColor: Color(0xFF0D0D2E),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Could not load user data. Please check your connection.\n$err',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        );
      },
      data: (userDoc) {
        // Veri geldi. Şimdi yönlendirme yap.
        if (!userDoc.exists) {
          // Bu olmamalı (kullanıcı var ama dökümanı yoksa),
          // ama olursa Login'e at.
          // Belki burada bir "hesap oluşturuluyor" ekranı gösterilebilir.
          // Şimdilik ana uygulamaya yönlendirelim, provider'lar boş veri gösterecek.
          return const NavigationShell();
        }

        final userData = userDoc.data() as Map<String, dynamic>? ?? {};

        // KARAR ANI:
        if (userData['has_completed_onboarding'] == true) {
          // Turu tamamlamış: Ana Uygulamaya git
          return const NavigationShell();
        } else {
          // Turu tamamlamamış: Karşılama Ekranına git
          return const OnboardingScreen();
        }
      },
    );
  }
}