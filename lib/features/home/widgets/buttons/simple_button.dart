import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 158.w,
        height: 61.h,
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
        child: Text(text, style: AppTextStyles.no34),
      ),
    );
  }
}
