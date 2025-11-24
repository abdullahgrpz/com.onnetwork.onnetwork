// lib/features/team/widgets/team_member_list_item.dart (LOKALİZASYON GÜNCELLENDİ)

import 'package:flutter/material.dart';
import 'package:on_network/features/team/models/team_member_model.dart';

// YENİ: Lokalizasyon importu eklendi
import 'package:on_network/generated/l10n/app_localizations.dart';

class TeamMemberListItem extends StatelessWidget {
  final TeamMember member;
  final VoidCallback? onRemind;
  final VoidCallback? onReport;
  final double currentBaseRate;
  final double currentBonusPercentage;

  const TeamMemberListItem({
    super.key,
    required this.member,
    this.onRemind,
    this.onReport,
    required this.currentBaseRate,
    required this.currentBonusPercentage,
  });

  @override
  Widget build(BuildContext context) {
    // YENİ: l10n (lokalizasyon) nesnesini context'ten al
    final l10n = AppLocalizations.of(context)!;

    // --- GÜNCELLENEN HESAPLAMA ---
    final double contributionAmount = currentBaseRate * currentBonusPercentage;
    // --- BİTTİ ---

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF00D1FF).withOpacity(0.2)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Theme.of(context).cardColor,
            backgroundImage: member.profileImageUrl != null
                ? NetworkImage(member.profileImageUrl!)
                : null,
            child: member.profileImageUrl == null
                ? const Icon(Icons.person, size: 30, color: Color(0xFF00D1FF))
                : null,
          ),
          const SizedBox(width: 12),
          Expanded( // <--- YENİ EKLENDİ
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.username, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                Text(member.handle, style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14)),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: member.isActive ? const Color(0xFF00D1FF).withOpacity(0.2) : Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  // GÜNCELLENDİ: Metin l10n'den geliyor
                  member.isActive ? l10n.teamMemberActive : l10n.teamMemberInactive,
                  style: TextStyle(color: member.isActive ? const Color(0xFF00D1FF) : Colors.red, fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ),
              const SizedBox(height: 4),

              Text(
                  '+${contributionAmount.toStringAsFixed(2)} ON/hour',
                  style: TextStyle(
                      color: member.isActive ? const Color(0xFF00D1FF) : Colors.white.withOpacity(0.3),
                      fontWeight: FontWeight.bold
                  )
              ),

              if (!member.isActive)
              // GÜNCELLENDİ: Metin l10n'den geliyor
                Text(l10n.teamMemberTapToRemind, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. BİLDİR (REPORT) BUTONU
              IconButton(
                icon: Icon(
                  Icons.flag_outlined,
                  color: onReport != null ? Colors.redAccent : Colors.white.withOpacity(0.3),
                ),
                iconSize: 24,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                // GÜNCELLENDİ: Tooltip metni l10n'den geliyor
                tooltip: l10n.teamMemberTooltipReport,
                onPressed: onReport,
              ),
              // 2. HATIRLAT (REMIND) BUTONU
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: onRemind != null ? const Color(0xFF00D1FF) : Colors.white.withOpacity(0.3),
                ),
                iconSize: 24,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                // GÜNCELLENDİ: Tooltip metni l10n'den geliyor
                tooltip: l10n.teamMemberTooltipRemind,
                onPressed: onRemind,
              ),
            ],
          ),
        ],
      ),
    );
  }
}