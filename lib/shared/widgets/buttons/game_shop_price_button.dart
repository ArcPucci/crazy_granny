import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';

class GameShopPriceButton extends StatelessWidget {
  const GameShopPriceButton({super.key, required this.buttonText, this.onTap});

  final String buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/png/button/button1.png',
            width: 76.w,
            height: 30.h,
            fit: BoxFit.fill,
          ),
          Text(buttonText, style: AppTextStyles.no18),
        ],
      ),
    );
  }
}
