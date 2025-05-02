import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';
import '../../../../../shared/shared.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 108.w,
        height: 45.h,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/png/button/button2.png'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: CustomStrokeText(
          text: text,
          strokeWidth: 1.sp,
          textStyle: AppTextStyles.no24,
          strokeColor: AppColors.orange1,
        ),
      ),
    );
  }
}
