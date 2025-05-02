import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/shared.dart';
import '../../features.dart';

class BarSlotPage extends StatelessWidget {
  const BarSlotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SlotGameProvider(
          provider: Provider.of(context, listen: false),
          goToBonusGame: () => context.go('/bar/slot/bonus'),
          showCongrats: (value, megaWin) => _showCongrats(
            context,
            value,
            megaWin,
          ),
        );
      },
      child: Consumer<SlotGameProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return Material(
            color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/png/bar_bg.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 35.h,
                  child: SafeArea(
                    child: CustomSpinSlot(
                      onInit: value.onInit,
                      onCompleted: value.checkResult,
                    ),
                  ),
                ),
                Positioned(
                  left: -26.65.w,
                  bottom: -139.h,
                  child: const AnimatedCrazyGranny(),
                ),
                Positioned(
                  top: 5.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SafeArea(
                      child: MiniGameAppBar(
                        onTapInfo: () => _showInfo(context),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 50.h,
                  child: SafeArea(
                    child: Column(
                      children: [
                        BetCountWidget(
                          bet: value.bet,
                          onIncrease: value.increaseBet,
                          onDecrease: value.decreaseBet,
                        ),
                        SizedBox(height: 20.h),
                        SpinButton(onTap: value.spin),
                      ],
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

  void _showInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const SlotGameInfoDialog();
      },
    );
  }

  void _showCongrats(BuildContext context, int coefficient, bool megaWin) {
    showDialog(
      context: context,
      builder: (context) {
        return SlotGameResultDialog(won: coefficient, megaWin: megaWin);
      },
    );
  }
}
