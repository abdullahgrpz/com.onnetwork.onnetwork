// lib/core/widgets/skeletons/skeleton_box.dart
import 'package:flutter/material.dart';

class SkeletonBox extends StatelessWidget {
  final double? width;
  final double height;
  final double borderRadius;

  const SkeletonBox({
    super.key,
    this.width,
    required this.height,
    this.borderRadius = 8.0, // Varsayılan köşe yuvarlaklığı
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1), // Placeholder rengi
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}