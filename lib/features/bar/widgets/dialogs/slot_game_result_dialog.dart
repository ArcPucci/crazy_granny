import 'package:crazy_granny/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class SlotGameResultDialog extends StatelessWidget {
  const SlotGameResultDialog({
    super.key,
    required this.won,
    required this.megaWin,
  });

  final bool megaWin;
  final int won;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildImage(),
          Positioned(
            top: 5.h,
            left: 0,
            right: 0,
            child: const Center(child: MiniGameAppBar(canTapPlus: false)),
          ),
          Positioned(
            bottom: 82.h,
            child: Row(
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
                  width: 76.r,
                  height: 75.r,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 5.w),
                Text("$won", style: AppTextStyles.no76),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (megaWin) {
      return Positioned(
        top: 138.h,
        child: Padding(
          padding: EdgeInsets.only(right: 19.w),
          child: Image.asset(
            'assets/png/mega_win.png',
            width: 286.w,
            height: 446.h,
          ),
        ),
      );
    }

    return Positioned(
      top: 121.h,
      child: Padding(
        padding: EdgeInsets.only(right: 13.w),
        child: Image.asset(
          'assets/png/big_win.png',
          width: 293.w,
          height: 493.h,
        ),
      ),
    );
  }
}
