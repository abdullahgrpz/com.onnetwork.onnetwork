// lib/core/widgets/skeletons/team_screen_skeleton.dart
import 'package:flutter/material.dart';
import 'package:on_network/core/widgets/skeletons/skeleton_box.dart';
import 'package:shimmer/shimmer.dart';

class TeamScreenSkeleton extends StatelessWidget {
  const TeamScreenSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withOpacity(0.1),
      highlightColor: Colors.white.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const SkeletonBox(width: 150, height: 30), // Title: Your Team
            const SizedBox(height: 12),
            const SkeletonBox(width: 250, height: 18), // Invite Code
            const SizedBox(height: 24),
            const SkeletonBox(width: 200, height: 16), // Contribution
            const SizedBox(height: 8),
            const SkeletonBox(width: 180, height: 16), // Current Team Members
            const SizedBox(height: 16),
            const SkeletonBox(width: 200, height: 40), // Invite Button
            const SizedBox(height: 40),
            // Avatar Cluster Placeholder (Basitleştirilmiş)
            const Center(child: SkeletonBox(width: 160, height: 160, borderRadius: 80)),
            const SizedBox(height: 40),
            // Team List Placeholder
            Expanded(
              child: ListView.builder(
                itemCount: 4, // 4 tane iskelet liste elemanı gösterelim
                itemBuilder: (context, index) => const _TeamListItemSkeleton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TeamMemberListItem için özel iskelet
class _TeamListItemSkeleton extends StatelessWidget {
  const _TeamListItemSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SkeletonBox(width: 56, height: 56, borderRadius: 28), // Avatar
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonBox(width: 100, height: 16), // Username
              SizedBox(height: 4),
              SkeletonBox(width: 80, height: 14), // Handle
            ],
          ),
          const Spacer(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SkeletonBox(width: 60, height: 18, borderRadius: 8), // Status
              SizedBox(height: 4),
              SkeletonBox(width: 80, height: 14), // Contribution/Remind
            ],
          ),
          const SizedBox(width: 8),
          const SkeletonBox(width: 40, height: 40, borderRadius: 20), // Bell Icon
        ],
      ),
    );
  }
}