import 'package:crazy_granny/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';

class GameResultDialog extends StatelessWidget {
  const GameResultDialog({super.key, this.won = true});

  final bool won;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        children: [
          SizedBox(height: 5.h),
          MiniGameAppBar(
            canTapPlus: false,
            onTapHome: () => _goHome(context),
          ),
          _buildImage(won),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/png/icons/plus.png',
                width: 32.w,
                height: 32.h,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 5.w),
              Image.asset(
                'assets/png/button.png',
                width: 76.w,
                height: 75.h,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 5.w),
              Text("5000", style: AppTextStyles.no76),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => _goHome(context),
            child: Text(
              "Back to the main game",
              style: AppTextStyles.no24.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 1.sp,
              ),
            ),
          ),
          SizedBox(height: 61.h),
        ],
      ),
    );
  }

  void _goHome(BuildContext context) {
    Navigator.of(context).pop();
    context.pop();
  }

  Widget _buildImage(bool won) {
    if (won) {
      return Padding(
        padding: EdgeInsets.only(top: 36.h, right: 35.w, bottom: 15.h),
        child: Image.asset(
          'assets/png/big_win.png',
          width: 293.w,
          height: 463.h,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 24.w, bottom: 20.h),
      child: Image.asset(
        'assets/png/lose.png',
        width: 324.w,
        height: 461.h,
      ),
    );
  }
}
