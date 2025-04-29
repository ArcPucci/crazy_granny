import 'package:crazy_granny/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils.dart';

class SpinButton extends StatelessWidget {
  const SpinButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 121.w,
        height: 48.h,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/png/button/button1.png'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, 6),
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: CustomStrokeText(
          text: "SPIN",
          textStyle: AppTextStyles.no32,
          strokeColor: AppColors.orange3,
          strokeWidth: 2.sp,
        ),
      ),
    );
  }
}
