import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';

class BarPage extends StatelessWidget {
  const BarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/bar_menu.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 8.w,
            bottom: 60.h,
            child: SafeArea(
              child: AnimatedImageWithText(
                text: 'GAME SLOT',
                duration: 2,
                image: 'assets/png/arrow_left.png',
                textPadding: EdgeInsets.only(left: 20.w),
                onTap: () => context.go('/bar/slot'),
              ),
            ),
          ),
          Positioned(
            right: 8.w,
            bottom: 60.h,
            child: SafeArea(
              child: AnimatedImageWithText(
                delay: 2,
                duration: 2,
                text: 'GAME BAR',
                image: 'assets/png/arrow_right.png',
                strokeColor: AppColors.purple1,
                textPadding: EdgeInsets.only(right: 25.w),
                onTap: () => context.go('/bar/bartender'),
              ),
            ),
          ),
          Positioned(
            top: 5.h,
            left: 0,
            right: 0,
            child: const SafeArea(child: Center(child: SimpleAppBar())),
          ),
        ],
      ),
    );
  }
}
