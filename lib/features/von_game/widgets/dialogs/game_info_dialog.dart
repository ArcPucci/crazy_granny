import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';
import '../../../../../shared/shared.dart';

class GameInfoDialog extends StatefulWidget {
  const GameInfoDialog({super.key});

  @override
  State<GameInfoDialog> createState() => _GameInfoDialogState();
}

class _GameInfoDialogState extends State<GameInfoDialog> {
  final controller = ScrollController();
  static final double _thumbHeight = 20.h;
  double _thumbPosition = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(_updateThumbPosition);
  }

  void _updateThumbPosition() {
    double maxScrollExtent = controller.position.maxScrollExtent;
    double viewHeight = controller.position.viewportDimension;

    if (maxScrollExtent > 0) {
      setState(() {
        _thumbPosition =
            (controller.offset / maxScrollExtent) * (viewHeight - _thumbHeight);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 19.h,
            child: SizedBox(
              width: 322.w,
              height: 342.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 322.w,
                      height: 288.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/png/frames/frame3.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 32.h),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            left: 42.w,
                            right: 42.w,
                            child: SingleChildScrollView(
                              controller: controller,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('1. ', style: AppTextStyles.no16),
                                      Expanded(
                                        child: Text(
                                          'Grandma moves back and forth, occasionally appearing in the windows. Your task is to tap the screen when Grandma is in the window and the target object passes by.',
                                          style: AppTextStyles.no16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Image.asset(
                                    'assets/png/info1.png',
                                    width: 228.w,
                                    height: 160.h,
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 5.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '2. ',
                                                  style: AppTextStyles.no16,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'The items Grandma throws can be purchased in the shop at any time.',
                                                    style: AppTextStyles.no16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 32.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '3. ',
                                                  style: AppTextStyles.no16,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'The game ends after 3 missed taps.',
                                                    style: AppTextStyles.no16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 7.w),
                                      Image.asset(
                                        'assets/png/info2.png',
                                        width: 39.w,
                                        height: 149.h,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 13.h),
                                  Image.asset(
                                    'assets/png/info3.png',
                                    width: 139.w,
                                    height: 42.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: _thumbPosition,
                            right: 25.w,
                            child: Container(
                              width: 2.w,
                              height: _thumbHeight,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 20),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
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
                        text: 'Daytime Fun',
                        textStyle: AppTextStyles.no28,
                        strokeColor: AppColors.purple1,
                        strokeWidth: 3.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12.h,
                    right: 0,
                    child: GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: Image.asset(
                        'assets/png/cross.png',
                        width: 17.w,
                        height: 17.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 22.h,
            right: 25.w,
            child: const MoneyCountWidget(),
          ),
        ],
      ),
    );
  }
}
