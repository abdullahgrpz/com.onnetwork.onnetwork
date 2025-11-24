import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_network/generated/l10n/app_localizations.dart';

class MarketplaceScreen extends ConsumerWidget {
  const MarketplaceScreen({super.key});

  Future<void> _launchSocial(String urlString, BuildContext context) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Link açılamadı: $urlString')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata: $e')),
        );
      }
    }
  }

  Future<void> _launchEmail(String email, BuildContext context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=ON Network Support',
    );
    try {
      if (!await launchUrl(emailLaunchUri)) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('E-posta uygulaması açılamadı.')),
          );
        }
      }
    } catch (e) {
      debugPrint('Email hatası: $e');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isIOS = Platform.isIOS;

    final String displayTitle = isIOS ? l10n.profileSectionCommunity : l10n.marketplaceTitle;
    final String displayDesc = isIOS ? l10n.profileTwitterSubtitle : l10n.marketplaceDescription;

    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      appBar: AppBar(
        title: Text(
          displayTitle, 
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF101010), Color(0xFF1A1A2E)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF00D1FF).withOpacity(0.3), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00D1FF).withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  isIOS ? Icons.people_alt_rounded : Icons.shopping_bag_outlined,
                  size: 80,
                  color: const Color(0xFF00D1FF),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                displayTitle,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                displayDesc,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), height: 1.5),
              ),
              const SizedBox(height: 48),
              Text(
                l10n.marketplaceCommunity,
                style: const TextStyle(color: Color(0xFF00D1FF), fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 14),
              ),
              const SizedBox(height: 24),
              
              // --- SOSYAL MEDYA BUTONLARI (PATRON ONAYLI LİNKLER) ---
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _SocialButton(
                    icon: FontAwesomeIcons.telegram,
                    color: const Color(0xFF0088cc),
                    onTap: () => _launchSocial('https://t.me/onnetworkapp', context),
                  ),
                  _SocialButton(
                    icon: FontAwesomeIcons.xTwitter,
                    color: Colors.white,
                    onTap: () => _launchSocial('https://x.com/onnetworkapp', context),
                  ),
                  _SocialButton(
                    icon: FontAwesomeIcons.instagram,
                    color: const Color(0xFFE1306C),
                    onTap: () => _launchSocial('https://www.instagram.com/onnetworkapp/', context),
                  ),
                  _SocialButton(
                    icon: FontAwesomeIcons.youtube,
                    color: const Color(0xFFFF0000),
                    onTap: () => _launchSocial('https://www.youtube.com/@onnetworkapp', context),
                  ),
                  _SocialButton(
                    icon: FontAwesomeIcons.facebook,
                    color: const Color(0xFF1877F2),
                    onTap: () => _launchSocial('https://www.facebook.com/profile.php?id=61583532664936', context),
                  ),
                  _SocialButton(
                    icon: FontAwesomeIcons.tiktok,
                    color: const Color(0xFF00F2EA),
                    onTap: () => _launchSocial('https://www.tiktok.com/@onnetworkapp', context),
                  ),
                   _SocialButton(
                    icon: Icons.language, 
                    color: const Color(0xFF00D1FF),
                    onTap: () => _launchSocial('https://onnetworkapp.com', context),
                  ),
                  _SocialButton(
                    icon: Icons.email_outlined,
                    color: Colors.amber,
                    onTap: () => _launchEmail('support@onnetworkapp.com', context),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SocialButton({required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 65, height: 65,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Center(child: FaIcon(icon, color: color, size: 32)),
      ),
    );
  }
}