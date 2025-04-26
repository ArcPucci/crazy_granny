import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallIconButton extends StatelessWidget {
  const SmallIconButton({super.key, required this.asset, this.onTap});

  final String asset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52.w,
        height: 45.h,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/png/button/small_button_1.png'),
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
        child: Image.asset(asset, width: 21.w, height: 21.h),
      ),
    );
  }
}
