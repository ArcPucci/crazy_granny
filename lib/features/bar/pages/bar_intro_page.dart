import 'dart:async';
import 'dart:math';

import 'package:crazy_granny/features/bar/bar.dart';
import 'package:crazy_granny/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils.dart';

class BarIntroPage extends StatefulWidget {
  const BarIntroPage({super.key});

  @override
  State<BarIntroPage> createState() => _BarIntroPageState();
}

class _BarIntroPageState extends State<BarIntroPage> {
  double _progress = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        final rand = Random().nextDouble() / 25;

        _progress += rand;
        setState(() {});

        if (_progress >= 1.00) {
          _progress = 1;
          setState(() {});

          _timer?.cancel();

          return;
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/bar_intro_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: -26.65.w,
            bottom: -50.5.h,
            child: const AnimatedCrazyGranny(),
          ),
          Positioned(
            top: 210.h,
            child: SafeArea(
              child: Column(
                children: [
                  CustomStrokeText(
                    text: "Loading...",
                    textStyle: AppTextStyles.no64,
                    strokeColor: AppColors.orange3,
                    strokeWidth: 4.sp,
                  ),
                  SizedBox(height: 15.h),
                  CustomProgressIndicator(progress: _progress),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
