// lib/features/home/widgets/honeycomb_background.dart

import 'package:flutter/material.dart';
import 'dart:math';

class HoneycombBackground extends StatelessWidget {
  const HoneycombBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CustomPaint(
        painter: _HoneycombPainter(),
      ),
    );
  }
}

class _HoneycombPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00D1FF).withOpacity(0.05) // Altıgenlerin rengi ve şeffaflığı
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const double radius = 50; // Her bir altıgenin yarıçapı
    final double hexHeight = sqrt(3) * radius;
    final double hexWidth = 2 * radius;

    for (double y = -hexHeight; y < size.height + hexHeight; y += hexHeight) {
      for (double x = -hexWidth, j = 0; x < size.width + hexWidth; x += hexWidth * 3 / 4, j++) {
        final double offsetY = (j % 2 == 0) ? 0 : hexHeight / 2;
        _drawHexagon(canvas, Offset(x, y + offsetY), radius, paint);
      }
    }
  }

  void _drawHexagon(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    for (int i = 0; i <= 6; i++) {
      final double angle = (pi / 3) * i - (pi / 6);
      final Offset point = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}