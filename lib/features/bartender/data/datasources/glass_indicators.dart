import 'dart:ui';

import 'package:crazy_granny/features/features.dart';

final List<GlassIndicator> glassIndicators = [
  GlassIndicator(
    id: 0,
    coefficient: 2,
    asset: 'assets/png/green_left.png',
    color: const Color(0xFF41BB00),
    dropShadow: const Color(0xFF2BE413),
  ),
  GlassIndicator(
    id: 1,
    coefficient: 5,
    asset: 'assets/png/orange_left.png',
    color: const Color(0xFFFF5D00),
    dropShadow: const Color(0xFFFF7B00),
  ),
  GlassIndicator(
    id: 2,
    coefficient: 10,
    asset: 'assets/png/yellow_left.png',
    color: const Color(0xFFFFC300),
    dropShadow: const Color(0xFFFFCC00),
  ),
];
