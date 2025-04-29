import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/shared.dart';
import '../../features.dart';

class BarSlotPage extends StatelessWidget {
  const BarSlotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/bar_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 35.h,
            child: SafeArea(
              child: Container(
                width: 390.w,
                height: 509.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/png/slot_rect.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: -26.65.w,
            bottom: -139.h,
            child: const AnimatedCrazyGranny(),
          ),
          Positioned(
            top: 5.h,
            left: 0,
            right: 0,
            child: const Center(child: SafeArea(child: MiniGameAppBar())),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50.h,
            child: SafeArea(
              child: Column(
                children: [
                  const BetCountWidget(bet: 1000),
                  SizedBox(height: 20.h),
                  const SpinButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
