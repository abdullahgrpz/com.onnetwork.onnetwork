// lib/core/widgets/skeletons/home_screen_skeleton.dart
import 'package:flutter/material.dart';
import 'package:on_network/core/widgets/skeletons/skeleton_box.dart';
import 'package:shimmer/shimmer.dart'; // Shimmer importu

class HomeScreenSkeleton extends StatelessWidget {
  const HomeScreenSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withOpacity(0.1), // Ana placeholder rengi
      highlightColor: Colors.white.withOpacity(0.2), // Parlama rengi
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            // Top Bar Placeholder
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonBox(width: 150, height: 28),
                SkeletonBox(width: 28, height: 28, borderRadius: 14), // Yuvarlak ikon
              ],
            ),
            const SizedBox(height: 24),
            // Stats Cards Placeholder
            const Row(
              children: [
                Expanded(child: _StatsCardSkeleton()),
                SizedBox(width: 12),
                Expanded(child: _StatsCardSkeleton()),
              ],
            ),
            // Activate Button Placeholder
            const Expanded(
              child: Center(
                child: SkeletonBox(width: 180, height: 180, borderRadius: 90), // Büyük daire
              ),
            ),
            // Timer Placeholder
            const SkeletonBox(width: 150, height: 30),
            const SizedBox(height: 20),
            // Balance Summary Placeholder
            const SkeletonBox(width: 250, height: 20),
            const SizedBox(height: 8),
            const SkeletonBox(width: 200, height: 16),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// StatsCard için özel iskelet
class _StatsCardSkeleton extends StatelessWidget {
  const _StatsCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkeletonBox(width: 100, height: 12), // Title
        SizedBox(height: 8),
        SkeletonBox(width: 80, height: 24), // Value
        SizedBox(height: 4),
        SkeletonBox(width: 120, height: 12), // SubValue
        SizedBox(height: 12),
        SkeletonBox(height: 4), // Progress bar
      ],
    );
  }
}