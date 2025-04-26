import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils.dart';
import '../shared.dart';
import 'buttons/buttons.dart';

class GameButtonsShopCard extends StatelessWidget {
  const GameButtonsShopCard({
    super.key,
    required this.quantity,
    required this.buttonText,
    this.bestPrice = false,
    this.onTap,
    this.padding,
  });

  final String quantity;
  final String buttonText;
  final bool bestPrice;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 304.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: padding ??
                EdgeInsets.only(
                  top: bestPrice ? 22.h : 0,
                  bottom: 10.h,
                ),
            child: Container(
              width: 243.w,
              height: 84.h,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/png/rects/rect1.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              padding: EdgeInsets.symmetric(horizontal: 9.w),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Image.asset(
                    'assets/png/buttons.png',
                    width: 74.w,
                    height: 65.h,
                  ),
                  SizedBox(
                    height: 65.h,
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        CustomStrokeText(
                          text: '$quantity Buttons',
                          textStyle: AppTextStyles.no24,
                          strokeColor: AppColors.orange1,
                          strokeWidth: 1.sp,
                        ),
                        const Spacer(),
                        GameShopPriceButton(
                          buttonText: buttonText,
                          onTap: onTap,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (bestPrice)
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/png/best_price.png',
                width: 84.w,
                height: 71.h,
              ),
            ),
        ],
      ),
    );
  }
}
