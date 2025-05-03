import 'dart:math';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double waveHeight;
  final double progress;
  final double wavePhase;

  WavePainter({
    required this.waveHeight,
    required this.progress,
    required this.wavePhase,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.topRight,
      colors: [
        const Color(0xFFFF9819),
        const Color(0xFFF85300),
        Colors.white.withValues(alpha: 0.59),
      ],
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    final path = Path();

    final baseHeight = size.height * (1 - progress);

    path.moveTo(0, size.height);
    path.lineTo(0, baseHeight);

    for (double x = 0.0; x <= size.width; x++) {
      double y =
          waveHeight * sin((x / size.width * 2 * pi) + wavePhase) + baseHeight;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.wavePhase != wavePhase;
}
