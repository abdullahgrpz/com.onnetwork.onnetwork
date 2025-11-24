// lib/features/home/widgets/stats_card.dart (GÜNCELLENDİ - Daha Kompakt)

import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final double progress;
  final Color? progressColor;
  final VoidCallback? onInfoTap; // Bilgi ikonuna tıklama olayı

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.progress,
    this.progressColor,
    this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12), // DEĞİŞİKLİK: 16 -> 12
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible( // <--- YENİ: Flexible ile sardık
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
                ),
              ),
              if (onInfoTap != null)
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: InkWell(
                    onTap: onInfoTap,
                    borderRadius: BorderRadius.circular(12),
                    child: const Icon(
                      Icons.info_outline,
                      size: 16,
                      color: Colors.white54,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4), // DEĞİŞİKLİK: 8 -> 4
          Text(
            value,
            // DEĞİŞİKLİK: displayMedium (20) -> 18
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 18),
          ),
          Text(
            subtitle,
            // DEĞİŞİKLİK: bodySmall (12) -> 11
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
          ),
          const SizedBox(height: 8), // DEĞİŞİKLİK: 12 -> 8
          LinearProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            backgroundColor: Theme.of(context).cardColor.withOpacity(0.6),
            valueColor: AlwaysStoppedAnimation<Color>(
                progressColor ?? Theme.of(context).primaryColor),
            minHeight: 3, // DEĞİŞİKLİK: 4 -> 3
            borderRadius: BorderRadius.circular(2),
          ),
        ],
      ),
    );
  }
}