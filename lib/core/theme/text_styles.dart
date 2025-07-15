import 'package:crazy_granny/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static const _mz = "Mazzard";
  static const _no = "NerkoOne";
  static const _so = "SeymourOne";

  static final TextStyle no76 = TextStyle(
    fontFamily: _no,
    fontSize: 76.r,
    color: Colors.white,
    shadows: [
      BoxShadow(
        offset: const Offset(0, 12),
        blurRadius: 12,
        color: Colors.black.withValues(alpha: 0.25),
      ),
    ],
  );

  static final TextStyle no64 = TextStyle(
    fontFamily: _no,
    fontSize: 64.r,
    height: 58 / 64,
    letterSpacing: -0.32,
    color: Colors.white,
  );

  static final TextStyle no59 = TextStyle(
    fontFamily: _no,
    fontSize: 59.r,
    color: Colors.white,
    shadows: const [
      BoxShadow(
        blurRadius: 12,
        color: Color(0xFFE75704),
      ),
    ],
  );

  static final TextStyle no48 = TextStyle(
    fontFamily: _no,
    fontSize: 48.r,
    letterSpacing: 0.78,
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

  static final TextStyle no20 = TextStyle(
    fontFamily: _no,
    fontSize: 20.r,
    height: 17 / 20,
    letterSpacing: -0.27,
    color: Colors.white,
  );

  static final TextStyle no30 = TextStyle(
    fontFamily: _no,
    fontSize: 30.r,
    color: Colors.white,
    shadows: [
      BoxShadow(
        offset: const Offset(0, 5),
        blurRadius: 5,
        color: Colors.black.withValues(alpha: 0.25),
      ),
    ],
  );

  static final TextStyle no24 = TextStyle(
    fontFamily: _no,
    fontSize: 24.r,
    height: 21 / 24,
    color: Colors.white,
  );

  static final TextStyle no12 = TextStyle(
    fontFamily: _no,
    fontSize: 12.r,
    height: 17 / 12,
    letterSpacing: -0.27,
    color: Colors.white,
  );

  static final TextStyle no18 = TextStyle(
    fontFamily: _no,
    fontSize: 18.r,
    height: 16 / 18,
    color: Colors.white,
  );

  static final TextStyle no16 = TextStyle(
    fontFamily: _no,
    fontSize: 16.r,
    height: 26 / 16,
    color: Colors.white,
  );

  static final TextStyle no15 = TextStyle(
    fontFamily: _no,
    fontSize: 15.r,
    height: 26 / 15,
    color: Colors.white,
  );

  static final TextStyle no17 = TextStyle(
    fontFamily: _no,
    fontSize: 17.r,
    height: 0.8,
    letterSpacing: -0.4,
    color: Colors.black,
  );

  static final TextStyle no24WithShadow = TextStyle(
    fontFamily: _no,
    fontSize: 24.r,
    height: 14 / 24,
    color: Colors.white,
    shadows: [
      BoxShadow(
        offset: const Offset(0, 4),
        blurRadius: 12,
        color: Colors.black.withValues(alpha: 0.25),
      ),
    ],
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
        color: Colors.black.withValues(alpha: 0.25),
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
        color: Colors.black.withValues(alpha: 0.25),
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

  static final TextStyle mz700_8 = TextStyle(
    fontFamily: _mz,
    fontSize: 8.r,
    fontWeight: FontWeight.w700,
    height: 10 / 8,
    color: AppColors.white1,
  );

  static final TextStyle so8 = TextStyle(
    fontFamily: _so,
    fontSize: 8.r,
    height: 10 / 8,
    color: AppColors.white1,
  );
}
