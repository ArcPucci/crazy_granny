import 'package:flutter/material.dart';

class SymmetricGlassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    final halfWidth = width / 2;

    final path = Path();

    // Начало: снизу посередине
    path.moveTo(halfWidth, height);

    // Левый край ножки бокала
    path.cubicTo(
      halfWidth - 10, height - 10,
      halfWidth - 15, height - 40,
      halfWidth - 15, height - 70,
    );

    // Левый край чаши
    path.cubicTo(
      halfWidth - 20, height - 120,
      halfWidth - 40, height - 150,
      halfWidth - 50, height - 170,
    );

    // Верхняя левая точка чаши
    path.lineTo(halfWidth - 50, 20);

    // Горлышко
    path.cubicTo(
      halfWidth - 40, 0,
      halfWidth + 40, 0,
      halfWidth + 50, 20,
    );

    // Правая сторона: теперь зеркально отразим путь
    path.lineTo(halfWidth + 50, height - 170);

    path.cubicTo(
      halfWidth + 40, height - 150,
      halfWidth + 20, height - 120,
      halfWidth + 15, height - 70,
    );

    path.cubicTo(
      halfWidth + 15, height - 40,
      halfWidth + 10, height - 10,
      halfWidth, height,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
