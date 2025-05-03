import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme.dart';
import '../../../shared/shared.dart';

class BetCountWidget extends StatelessWidget {
  const BetCountWidget({
    super.key,
    required this.bet,
    this.onIncrease,
    this.onDecrease,
    this.disabled = false,
  });

  final int bet;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230.w,
      height: 60.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 189.w,
            height: 60.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/png/frames/frame8.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/png/button.png',
                  width: 34.w,
                  height: 34.h,
                ),
                SizedBox(width: 12.w),
                Text(
                  "$bet",
                  style: AppTextStyles.no30.copyWith(
                    color: disabled ? const Color(0xFF656262) : null,
                    fontSize: 30.r,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            child: SmallIconButton(
              width: 40.w,
              height: 35.h,
              iconWidth: 11.w,
              iconHeight: 2.sp,
              asset: 'assets/png/icons/minus.png',
              onTap: onDecrease,
              disabled: disabled,
            ),
          ),
          Positioned(
            right: 0,
            child: SmallIconButton(
              width: 40.w,
              height: 35.h,
              iconWidth: 11.w,
              iconHeight: 11.h,
              asset: 'assets/png/icons/plus.png',
              onTap: onIncrease,
              disabled: disabled,
            ),
          ),
        ],
      ),
    );
  }
}
