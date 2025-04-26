import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static const _mz = "Mazzard";
  static const _no = "NerkoOne";

  static final TextStyle no64 = TextStyle(
    fontFamily: _no,
    fontSize: 64.r,
    height: 58 / 64,
    letterSpacing: -0.32,
    color: Colors.white,
  );

  static final TextStyle no34 = TextStyle(
    fontFamily: _no,
    fontSize: 34.r,
    height: 28 / 34,
    letterSpacing: 1.34,
    color: Colors.white,
  );

  static final TextStyle no32 = TextStyle(
    fontFamily: _no,
    fontSize: 32.r,
    height: 24 / 32,
    color: Colors.white,
  );

  static final TextStyle no24 = TextStyle(
    fontFamily: _no,
    fontSize: 24.r,
    height: 21 / 24,
    color: Colors.white,
  );

  static final TextStyle no18 = TextStyle(
    fontFamily: _no,
    fontSize: 18.r,
    height: 16 / 18,
    color: Colors.white,
  );

  static final TextStyle no26 = TextStyle(
    fontFamily: _no,
    fontSize: 26.r,
    height: 14 / 26,
    color: Colors.white,
    shadows: [
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: 12,
        color: Colors.black.withOpacity(0.25),
      ),
    ],
  );

  static final TextStyle no28 = TextStyle(
    fontFamily: _no,
    fontSize: 28.r,
    height: 18 / 28,
    color: Colors.white,
    shadows: [
      BoxShadow(
        offset: const Offset(0, 3),
        blurRadius: 9,
        color: Colors.black.withOpacity(0.25),
      ),
    ],
  );

  static final TextStyle mz500_24 = TextStyle(
    fontFamily: _mz,
    fontSize: 24.r,
    fontWeight: FontWeight.w500,
    height: 30 / 24,
    letterSpacing: -0.32,
    color: Colors.white,
  );
}
