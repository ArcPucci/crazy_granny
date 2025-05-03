import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';

class BartenderGameInfoDialog extends StatefulWidget {
  const BartenderGameInfoDialog({super.key});

  @override
  State<BartenderGameInfoDialog> createState() =>
      _BartenderGameInfoDialogState();
}

class _BartenderGameInfoDialogState extends State<BartenderGameInfoDialog> {
  final controller = ScrollController();
  static final double _thumbHeight = 20.h;
  double _thumbPosition = 0;

  final widths = [230.w, 233.w, 221.w, 224.w, 223.w];
  final list = List.generate(5, (index) => 'assets/png/bar${index + 1}.png');
  final texts = [
    "Select a faucet by clicking on the circle with a plus sign. You can select several faucets - a separate bet is placed on each.",
    "Set your desired bet—it applies to all selected taps.  Ready? Press the drop button to start pouring!",
    "The pouring is done in stages, one click on the button - one pouring, the glass is filled in parts, each part is a multiplier of your bet, the largest multiplier is 10x",
    "After each click, you will immediately see whether the move was winning or not, the bet increases in accordance with the level of liquid in the glass and its multiplier. Your winnings depend on each click, so think about whether to continue or take the existing winnings at this stage. To take the winnings, click the button next to the drop button, it depicts a hand with a coin, if you do not want to risk.",
    "If your bet was unsuccessful, it burns out, this happens when the cider runs out in the tap, turn on all your intuition to understand when to stop and take the winnings. After losing, instead of a glass, a sign \" Lose\" will appear as a sign of inactivity",
  ];

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
                                  Text(
                                    "Welcome!",
                                    style: AppTextStyles.no24.copyWith(
                                      color: AppColors.yellow1,
                                    ),
                                  ),
                                  SizedBox(width: 10.h),
                                  Text(
                                    "You're at a casino bar where they serve the best cider in town! But it's running low, and you need to guess which tap can fill your glass. Your goal is to choose the taps and fill the glass step by step, but be careful: the cider could run out at any moment!",
                                    style: AppTextStyles.no12,
                                  ),
                                  SizedBox(height: 24.h),
                                  ...List.generate(
                                    list.length,
                                    (index) {
                                      final text = texts[index];
                                      final width = widths[index];
                                      final image = list[index];
                                      return Padding(
                                        padding: EdgeInsets.only(top: index == 0 ? 0 : 24.h),
                                        child: _buildBody(
                                          index + 1,
                                          text,
                                          width,
                                          image,
                                        ),
                                      );
                                    },
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
            top: 14.h,
            right: 27.w,
            child: const MoneyCountWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(index, text, width, image) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "$index step",
            style: AppTextStyles.no20.copyWith(color: AppColors.orange4),
          ),
        ),
        SizedBox(height: 10.h),
        Text(text, style: AppTextStyles.no12.copyWith(letterSpacing: 0)),
        SizedBox(height: 10.h),
        Image.asset(image, width: width),
      ],
    );
  }
}
