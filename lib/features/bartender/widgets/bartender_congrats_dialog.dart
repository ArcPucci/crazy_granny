import 'package:crazy_granny/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/shared.dart';

class BartenderCongratsDialog extends StatefulWidget {
  const BartenderCongratsDialog({super.key, required this.won});

  final int won;

  @override
  State<BartenderCongratsDialog> createState() =>
      _BartenderCongratsDialogState();
}

class _BartenderCongratsDialogState extends State<BartenderCongratsDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) async {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 408.w,
            height: 226.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 0,
                  child: Stack(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Image.asset(
                          'assets/png/win_table.png',
                          width: 322.w,
                          height: 212.h,
                        ),
                      ),
                      Positioned(
                        top: 100.h,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 51.w),
                            Image.asset(
                              'assets/png/button.png',
                              width: 37.w,
                              height: 37.h,
                            ),
                            SizedBox(width: 11.w),
                            Text(
                              "${widget.won}",
                              style: AppTextStyles.no59.copyWith(
                                fontSize: 59.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset(
                      'assets/png/sidres.png',
                      width: 194.w,
                      height: 193.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 14.h,
            left: 42.w,
            child: SizedBox(
              width: 110.w,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallIconButton(asset: 'assets/png/icons/home.png'),
                  SmallIconButton(asset: 'assets/png/icons/question.png'),
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
}
