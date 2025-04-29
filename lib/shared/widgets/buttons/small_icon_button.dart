import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallIconButton extends StatelessWidget {
  const SmallIconButton({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.iconWidth,
    this.iconHeight,
    this.onTap,
  });

  final String asset;
  final double? width;
  final double? height;
  final double? iconWidth;
  final double? iconHeight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 52.w,
        height: height ?? 45.h,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/png/button/small_button_1.png'),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Image.asset(
          asset,
          width: iconWidth ?? 21.w,
          height: iconHeight ?? 21.h,
        ),
      ),
    );
  }
}
