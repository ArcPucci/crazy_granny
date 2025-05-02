import 'package:crazy_granny/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';

class MoneyCountWidget extends StatelessWidget {
  const MoneyCountWidget({super.key, this.onTapPlus});

  final VoidCallback? onTapPlus;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppDataProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return SizedBox(
          width: 121.w,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                width: 113.w,
                height: 45.h,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/png/button/button3.png'),
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
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/png/button.png',
                      width: 27.w,
                      height: 27.h,
                    ),
                    Expanded(
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            "${value.gameButtons}",
                            style: AppTextStyles.no24.copyWith(
                              shadows: [
                                BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 12,
                                  color: Colors.black.withValues(alpha: 0.25),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: onTapPlus,
                  child: Image.asset(
                    'assets/png/add.png',
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
