import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';
import '../shared.dart';

class FallingItemShopCard extends StatelessWidget {
  const FallingItemShopCard({super.key, required this.item, this.onBuy});

  final ShopItem item;
  final VoidCallback? onBuy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 253.w,
      height: 75.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                item.asset,
                width: 64.w,
                height: 64.h,
              ),
              Container(
                width: 181.w,
                height: 36.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/png/rects/rect2.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: Alignment.center,
                child: CustomStrokeText(
                  text: item.name,
                  textStyle: AppTextStyles.no18,
                  strokeColor: AppColors.orange1,
                  strokeWidth: 1.sp,
                ),
              ),
            ],
          ),
          Positioned(
            right: 54.w,
            bottom: 0,
            child: GestureDetector(
              onTap: onBuy,
              child: Container(
                width: 76.w,
                height: 30.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/png/button/button1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/png/button.png',
                      width: 16.w,
                      height: 16.h,
                    ),
                    SizedBox(width: 5.w),
                    Text("${item.price}", style: AppTextStyles.no18),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
