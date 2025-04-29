import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265.w,
      height: 45.h,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/png/rect6.png'),
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
      padding: EdgeInsets.only(left: 7.5.w),
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        width: 250.w * progress,
        height: 35.h,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            image: AssetImage('assets/png/rect5.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
