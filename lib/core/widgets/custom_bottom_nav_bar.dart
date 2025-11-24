// lib/core/widgets/custom_bottom_nav_bar.dart (LOKALİZASYON GÜNCELLENDİ)

import 'package:flutter/material.dart';
// YENİ: Lokalizasyon importu eklendi
import 'package:on_network/generated/l10n/app_localizations.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    // YENİ: l10n (lokalizasyon) nesnesini context'ten al
    final l10n = AppLocalizations.of(context)!;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF27274D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // GÜNCELLENDİ: 'Home' -> l10n.navHome
          _buildNavItem(icon: Icons.home, label: l10n.navHome, index: 0),
          // GÜNCELLENDİ: 'Team' -> l10n.navTeam
          _buildNavItem(icon: Icons.people_alt, label: l10n.navTeam, index: 1),
          // GÜNCELLENDİ: 'Marketplace' -> l10n.navMarketplace
          _buildNavItem(icon: Icons.storefront, label: l10n.navMarketplace, index: 2),
          // GÜNCELLENDİ: 'Profile' -> l10n.navProfile
          _buildNavItem(icon: Icons.person, label: l10n.navProfile, index: 3),
        ],
      ),
    );
  }

  // Bu fonksiyonda bir değişiklik yok, olduğu gibi kalıyor
  Widget _buildNavItem({required IconData icon, required String label, required int index, bool isDisabled = false}) {
    final bool isActive = selectedIndex == index;
    final color = isDisabled
        ? Colors.white.withOpacity(0.2)
        : isActive
        ? const Color(0xFF00D1FF)
        : Colors.white.withOpacity(0.5);

    return InkWell(
      onTap: isDisabled ? null : () => onItemTapped(index),
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}