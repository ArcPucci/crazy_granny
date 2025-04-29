import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils.dart';
import '../../../../shared/shared.dart';

class BonusGameInfoDialog extends StatefulWidget {
  const BonusGameInfoDialog({super.key});

  @override
  State<BonusGameInfoDialog> createState() => _BonusGameInfoDialogState();
}

class _BonusGameInfoDialogState extends State<BonusGameInfoDialog> {
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
            top: 184.h,
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
                                      Text('1. ', style: AppTextStyles.no15),
                                      Expanded(
                                        child: Text(
                                          "Congratulations, you've entered the bonus game! Your task is to use the aiming scope located in the bottom left corner to target an object where you believe a bonus coin might be hidden.",
                                          style: AppTextStyles.no15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.h),
                                  Image.asset(
                                    'assets/png/joystick_example.png',
                                    width: 91.w,
                                    height: 88.h,
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('2. ', style: AppTextStyles.no15),
                                      Expanded(
                                        child: Text(
                                          "Once you’ve aimed, press the \"Shoot\" button to make a shot and see the result.",
                                          style: AppTextStyles.no15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.h),
                                  Image.asset(
                                    'assets/png/shoot_example.png',
                                    width: 91.w,
                                    height: 88.h,
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('3. ', style: AppTextStyles.no15),
                                      Expanded(
                                        child: Text(
                                          "If there's a coin behind the object you shot at, you win an additional reward.",
                                          style: AppTextStyles.no15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('4. ', style: AppTextStyles.no15),
                                      Expanded(
                                        child: Text(
                                          "If not, you’ll return to the main game.",
                                          style: AppTextStyles.no15,
                                        ),
                                      ),
                                    ],
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
                        text: 'BONUS GAME',
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
            top: 5.h,
            left: 0,
            right: 0,
            child: const Center(child: MiniGameAppBar()),
          ),
        ],
      ),
    );
  }
}
