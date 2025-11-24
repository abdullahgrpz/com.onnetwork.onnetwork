// lib/features/auth/view/onboarding_screen.dart (LOKALİZASYON GÜNCELLENDİ)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_network/navigation_shell.dart';

// YENİ: Lokalizasyon importu eklendi
import 'package:on_network/generated/l10n/app_localizations.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Kullanıcının bu ekranı tamamladığını Firestore'a kaydet
  Future<void> _completeOnboarding() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({'has_completed_onboarding': true});

      if (mounted) {
        // Tamamladıktan sonra ana uygulamaya yönlendir
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavigationShell()),
        );
      }
    } catch (e) {
      // Hata olursa en azından ana sayfaya gitsin
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not save progress: $e')),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavigationShell()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // YENİ: l10n (lokalizasyon) nesnesini context'ten al
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  // GÜNCELLENDİ: Tüm metinler l10n nesnesinden geliyor
                  _OnboardingPage(
                    icon: Icons.public,
                    title: l10n.onboardingWelcomeTitle,
                    description: l10n.onboardingWelcomeDesc,
                  ),
                  _OnboardingPage(
                    icon: Icons.power_settings_new,
                    title: l10n.onboardingMineTitle,
                    description: l10n.onboardingMineDesc,
                  ),
                  _OnboardingPage(
                    icon: Icons.people_alt,
                    title: l10n.onboardingTeamTitle,
                    description: l10n.onboardingTeamDesc,
                  ),
                ],
              ),
            ),
            // "İlerle" ve "Başla" Butonu
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  if (_currentPage == 2) {
                    // Son sayfadaysa, tamamla
                    _completeOnboarding();
                  } else {
                    // Değilse, sonraki sayfaya git
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                // GÜNCELLENDİ: Buton metni l10n'den geliyor
                child: Text(
                  _currentPage == 2 ? l10n.onboardingStart : l10n.onboardingNext,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Her bir karşılama sayfasının şablonu
// (Bu widget'da değişiklik yok, metinleri zaten parametre olarak alıyor)
class _OnboardingPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _OnboardingPage({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF00D1FF), size: 120),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}