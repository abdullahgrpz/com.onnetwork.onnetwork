// lib/features/profile/view/project_info_screen.dart (LOKALİZASYON GÜNCELLENDİ)

import 'package:flutter/material.dart';

// YENİ: Lokalizasyon importu eklendi
import 'package:on_network/generated/l10n/app_localizations.dart';

class ProjectInfoScreen extends StatelessWidget {
  const ProjectInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // YENİ: l10n (lokalizasyon) nesnesini context'ten al
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        // GÜNCELLENDİ: Metin l10n'den geliyor
        title: Text(l10n.projectInfoTitle),
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GÜNCELLENDİ: Metinler l10n'den geliyor
            _buildSectionTitle(context, l10n.projectInfoSection1Title),
            _buildSectionText(l10n.projectInfoSection1Content),
            const SizedBox(height: 24),

            // GÜNCELLENDİ: Metinler l10n'den geliyor
            _buildSectionTitle(context, l10n.projectInfoSection2Title),
            _buildSectionText(l10n.projectInfoSection2Content),
            const SizedBox(height: 24),

            // GÜNCELLENDİ: Metinler l10n'den geliyor
            _buildSectionTitle(context, l10n.projectInfoSection3Title),
            _buildRoadmapStep(
                Icons.people,
                l10n.projectInfoRoadmap1Title,
                l10n.projectInfoRoadmap1Content
            ),
            _buildRoadmapStep(
                Icons.storefront,
                l10n.projectInfoRoadmap2Title,
                l10n.projectInfoRoadmap2Content
            ),
            _buildRoadmapStep(
                Icons.swap_horiz,
                l10n.projectInfoRoadmap3Title,
                l10n.projectInfoRoadmap3Content
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Bu widget'larda değişiklik yok, metinleri zaten parametre olarak alıyorlar
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(color: const Color(0xFF00D1FF)),
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16, height: 1.5),
    );
  }

  Widget _buildRoadmapStep(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF00D1FF), size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}