import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils.dart';
import '../../../../../shared/shared.dart';
import '../../../features.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay(this.game, {super.key});

  final VonGame game;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 844.w,
      height: 390.h,
      child: Material(
        color: Colors.black.withValues(alpha: 0.56),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Container(
              width: 179.w,
              height: 42.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/frames/frame2.png'),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: Alignment.center,
              child: CustomStrokeText(
                text: 'Good Job!',
                textStyle: AppTextStyles.no28,
                strokeColor: AppColors.purple1,
                strokeWidth: 3.sp,
              ),
            ),
            SizedBox(height: 11.h),
            Container(
              width: 322.w,
              height: 207.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/frames/frame3.png'),
                  fit: BoxFit.fill,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 42.w, horizontal: 35.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFrame(
                        width: 120.w,
                        height: 56.h,
                        asset: 'assets/png/frames/frame6.png',
                        padding: EdgeInsets.only(top: 7.h),
                        child: Column(
                          children: [
                            Text("Best Score:", style: AppTextStyles.so8),
                            SizedBox(height: 4.h),
                            Text(
                              "1000",
                              style: AppTextStyles.no32.copyWith(
                                color: AppColors.white1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomFrame(
                        width: 120.w,
                        height: 56.h,
                        asset: 'assets/png/frames/frame6.png',
                        padding: EdgeInsets.only(top: 7.h),
                        child: Column(
                          children: [
                            Text("Your Score:", style: AppTextStyles.so8),
                            SizedBox(height: 4.h),
                            Text(
                              "1000",
                              style: AppTextStyles.no32.copyWith(
                                color: AppColors.white1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButton('Try Again', game.restartGame),
                      _buildButton('Home', context.pop),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String title, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 111.w,
        height: 37.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/rects/rect3.png'),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        child: CustomStrokeText(
          text: title,
          textStyle: AppTextStyles.no24,
          strokeColor: AppColors.purple1,
          strokeWidth: 3.sp,
        ),
      ),
    );
  }
}
