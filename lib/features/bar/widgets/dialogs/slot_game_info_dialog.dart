import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/core.dart';
import '../../../../../shared/shared.dart';

class SlotGameInfoDialog extends StatefulWidget {
  const SlotGameInfoDialog({super.key});

  @override
  State<SlotGameInfoDialog> createState() => _SlotGameInfoDialogState();
}

class _SlotGameInfoDialogState extends State<SlotGameInfoDialog> {
  final controller = ScrollController();
  static final double _thumbHeight = 20.h;
  double _thumbPosition = 0;
  final list = [5, 7, 10, 20];

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
                            left: 46.w,
                            right: 24.w,
                            child: SingleChildScrollView(
                              controller: controller,
                              child: Column(
                                children: List.generate(
                                  list.length,
                                  (index) {
                                    final fr = list[index];
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        top: index != 0 ? 23.h : 0,
                                      ),
                                      child: _buildIndicator(fr),
                                    );
                                  },
                                ),
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
                        text: 'RULES',
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
            child: const Center(child: MiniGameAppBar(canTapPlus: false)),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(int fr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        2,
        (j) {
          return SizedBox(
            width: 108.w,
            height: 78.h,
            child: Row(
              children: [
                Image.asset(
                  'assets/png/slot/${fr}x${j + 1}.png',
                  width: 44.w,
                  height: 78.h,
                  fit: BoxFit.fill,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "- ${fr}x",
                      style: AppTextStyles.no20,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
