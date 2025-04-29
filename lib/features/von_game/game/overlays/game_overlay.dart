import 'package:crazy_granny/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils.dart';
import '../../../../../shared/shared.dart';
import '../../widgets/dialogs/dialogs.dart';
import '../game.dart';

class GameOverlay extends StatelessWidget {
  const GameOverlay(this.game, {super.key});

  final VonGame game;

  @override
  Widget build(BuildContext context) {
    final manager = game.gameManager;
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
                  GestureDetector(
                    onTap: () => _showShop(
                      context,
                      manager.pauseGame,
                      manager.continueGame,
                    ),
                    child: Container(
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
                            color: Colors.black.withValues(alpha: 0.25),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: CustomStrokeText(
                        text: 'Shop',
                        textStyle: AppTextStyles.no24.copyWith(fontSize: 24.r),
                        strokeColor: AppColors.orange1,
                        strokeWidth: 1.sp,
                      ),
                    ),
                  ),
                  SmallIconButton(
                    asset: 'assets/png/icons/home.png',
                    onTap: context.pop,
                  ),
                  SmallIconButton(
                    asset: 'assets/png/icons/question.png',
                    onTap: () => _showInfo(
                      context,
                      manager.pauseGame,
                      manager.continueGame,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 22.h,
            right: 25.w,
            child: MoneyCountWidget(
              onTapPlus: () => _showButtonsShop(
                context,
                manager.pauseGame,
                manager.continueGame,
              ),
            ),
          ),
          Positioned(
            right: 25.w,
            bottom: 10.h,
            child: Row(
              children: [
                CustomFrame(
                  width: 94.w,
                  height: 56.h,
                  asset: 'assets/png/frames/frame5.png',
                  padding: EdgeInsets.only(top: 7.h),
                  child: Column(
                    children: [
                      Text(
                        "Miss:",
                        style: AppTextStyles.mz700_8.copyWith(fontSize: 8.r),
                      ),
                      SizedBox(height: 4.h),
                      ValueListenableBuilder(
                        valueListenable: manager.miss,
                        builder: (context, value, child) {
                          return Text(
                            "$value",
                            style: AppTextStyles.no32.copyWith(
                              fontSize: 32.r,
                              color: AppColors.white1,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                CustomFrame(
                  width: 120.w,
                  height: 56.h,
                  asset: 'assets/png/frames/frame6.png',
                  padding: EdgeInsets.only(top: 7.h),
                  child: Column(
                    children: [
                      Text(
                        "Score:",
                        style: AppTextStyles.so8.copyWith(fontSize: 8.r),
                      ),
                      SizedBox(height: 4.h),
                      ValueListenableBuilder(
                        valueListenable: manager.score,
                        builder: (context, value, child) {
                          return Text(
                            "$value",
                            style: AppTextStyles.no32.copyWith(
                              fontSize: 32.r,
                              color: AppColors.white1,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 30.w,
            bottom: 10.h,
            child: CustomFrame(
              width: 70.w,
              height: 289.h,
              asset: 'assets/png/frames/frame7.png',
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/shoes.png',
                        width: 52.w,
                        height: 25.h,
                      ),
                      SizedBox(height: 5.h),
                      ValueListenableBuilder(
                        valueListenable: manager.shoesCount,
                        builder: (context, value, child) {
                          return _buildTable(value);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/flower.png',
                        width: 47.w,
                        height: 50.h,
                      ),
                      SizedBox(height: 5.h),
                      ValueListenableBuilder(
                        valueListenable: manager.flowersCount,
                        builder: (context, value, child) {
                          return _buildTable(value);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/book.png',
                        width: 48.w,
                        height: 27.h,
                      ),
                      SizedBox(height: 5.h),
                      ValueListenableBuilder(
                        valueListenable: manager.booksCount,
                        builder: (context, value, child) {
                          return _buildTable(value);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/needle.png',
                        width: 49.w,
                        height: 42.h,
                      ),
                      SizedBox(height: 5.h),
                      ValueListenableBuilder(
                        valueListenable: manager.needlesCount,
                        builder: (context, value, child) {
                          return _buildTable(value);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTable(int score) {
    return Container(
      width: 42.w,
      height: 14.h,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        '$score',
        style: AppTextStyles.no17.copyWith(fontSize: 17.r),
      ),
    );
  }

  void _showShop(
    BuildContext context,
    VoidCallback? pauseGame,
    VoidCallback? continueGame,
  ) async {
    pauseGame?.call();
    await showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return const FallingItemsShopDialog();
      },
    );
    continueGame?.call();
  }

  void _showButtonsShop(
    BuildContext context,
    VoidCallback? pauseGame,
    VoidCallback? continueGame,
  ) async {
    pauseGame?.call();
    await showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return const ButtonShopDialog();
      },
    );
    continueGame?.call();
  }

  void _showInfo(
    BuildContext context,
    VoidCallback? pauseGame,
    VoidCallback? continueGame,
  ) async {
    pauseGame?.call();
    await showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return const GameInfoDialog();
      },
    );
    continueGame?.call();
  }
}
