import 'package:crazy_granny/features/von_game/presentation/game/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/theme.dart';
import '../../../../../shared/shared.dart';

class GameOverlay extends StatelessWidget {
  const GameOverlay(this.game, {super.key});

  final VonGame game;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Positioned(
            top: 22.h,
            left: 30.w,
            child: SizedBox(
              width: 228.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 108.w,
                    height: 46.h,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/png/frames/frame4.png'),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: CustomStrokeText(
                      text: 'Shop',
                      textStyle: AppTextStyles.no24,
                      strokeColor: AppColors.orange1,
                      strokeWidth: 1.sp,
                    ),
                  ),
                  const SmallIconButton(
                    asset: 'assets/png/icons/home.png',
                  ),
                  const SmallIconButton(
                    asset: 'assets/png/icons/question.png',
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
