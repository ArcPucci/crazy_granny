import 'package:crazy_granny/shared/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';

class LivingRoomPage extends StatefulWidget {
  const LivingRoomPage({super.key});

  @override
  State<LivingRoomPage> createState() => _LivingRoomPageState();
}

class _LivingRoomPageState extends State<LivingRoomPage> {
  @override
  void initState() {
    super.initState();
    ScreenUtil.ensureScreenSize();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<AppDataRepository>(context, listen: false);
      if (await provider.getLastDailyReward()) _showDailyBonusDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/living_room.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 76.h,
            left: 81.w,
            child: SafeArea(
              child: Image.asset(
                'assets/png/granny.png',
                width: 235.w,
                height: 649.h,
              ),
            ),
          ),
          Positioned(
            left: 8.w,
            bottom: 112.h,
            child: SafeArea(
              child: AnimatedImageWithText(
                text: 'NIGHT FUN',
                image: 'assets/png/arrow_left.png',
                textPadding: EdgeInsets.only(left: 20.w),
                onTap: () => context.go('/bar_intro'),
              ),
            ),
          ),
          Positioned(
            right: 8.w,
            bottom: 112.h,
            child: SafeArea(
              child: AnimatedImageWithText(
                text: 'DAYTIME FUN',
                image: 'assets/png/arrow_right.png',
                strokeColor: AppColors.purple1,
                textPadding: EdgeInsets.only(right: 10.w),
                onTap: () => context.go('/von_game'),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 25.h,
            child: SafeArea(
              child: CustomStrokeText(
                text: "Choose your way",
                strokeWidth: 4.sp,
                textStyle: AppTextStyles.no32,
                strokeColor: AppColors.purple2,
              ),
            ),
          ),
          Positioned(
            top: 16.h,
            left: 0,
            right: 0,
            child: Center(
              child: SafeArea(
                child: MainAppBar(
                  onTapShop: _showShop,
                  onTapPlus: _showButtonsDialog,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showButtonsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const GameMoneyDialog();
      },
    );
  }

  void _showShop() {
    showDialog(
      context: context,
      builder: (context) {
        return const GrannyItemsShopDialog();
      },
    );
  }

  void _showDailyBonusDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const DailyBonusDialog();
      },
    );
  }
}
