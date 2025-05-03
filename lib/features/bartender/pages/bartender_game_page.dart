import 'package:crazy_granny/features/bar/bar.dart';
import 'package:crazy_granny/features/bartender/bartender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/shared.dart';

class BartenderGamePage extends StatefulWidget {
  const BartenderGamePage({super.key});

  @override
  State<BartenderGamePage> createState() => _BartenderGamePageState();
}

class _BartenderGamePageState extends State<BartenderGamePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(844, 390),
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (BuildContext context) {
            return BartenderGameProvider(
              Provider.of(context, listen: false),
              _showCongrats,
            );
          },
          child: Consumer<BartenderGameProvider>(
            builder: (context, value, child) {
              final empty = value.sidrs.every((element) => !element.active);
              return Material(
                color: Colors.black,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/png/bartender_game_bg.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned.fill(
                      child: SafeArea(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              width: 500.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  value.sidrs.length,
                                  (index) {
                                    final sidr = value.sidrs[index];
                                    return SidrWidget(
                                      active: sidr.active,
                                      pulsing: empty,
                                      selected: value.selected == index,
                                      onInit: (fill) =>
                                          value.onInit(index, fill),
                                      onSelect: () => value.onSelect(index),
                                      onAdd: () => value.onAdd(index),
                                      onCompleted: (coef) =>
                                          value.onCompleted(index, coef),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              top: 14.h,
                              left: 42.w,
                              child: SizedBox(
                                width: 110.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallIconButton(
                                      asset: 'assets/png/icons/home.png',
                                      onTap: context.pop,
                                    ),
                                    SmallIconButton(
                                      asset: 'assets/png/icons/question.png',
                                      onTap: _showInfo,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Center(
                                child: SizedBox(
                                  width: 435.w,
                                  child: Row(
                                    children: [
                                      BetCountWidget(
                                        bet: value.bet,
                                        disabled: !value.canBet,
                                        onIncrease: value.increaseBet,
                                        onDecrease: value.decreaseBet,
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: value.fill,
                                        child: Image.asset(
                                          value.canFill
                                              ? 'assets/png/button/active_drop.png'
                                              : 'assets/png/button/inactive_drop.png',
                                          width: 83.w,
                                          height: 70.h,
                                        ),
                                      ),
                                      SizedBox(width: 14.w),
                                      GestureDetector(
                                        onTap: value.takeMoney,
                                        child: Image.asset(
                                          value.canTakeMoney
                                              ? 'assets/png/button/active_hand.png'
                                              : 'assets/png/button/inactive_hand.png',
                                          width: 83.w,
                                          height: 70.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 14.h,
                              right: 27.w,
                              child: MoneyCountWidget(onTapPlus: _showShop),
                            ),
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
      },
    );
  }

  void _showInfo() {
    showDialog(
      context: context,
      builder: (context) {
        return const BartenderGameInfoDialog();
      },
    );
  }

  void _showShop() {
    showDialog(
      context: context,
      builder: (context) {
        return const BartenderShopDialog();
      },
    );
  }

  void _showCongrats(int value) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BartenderCongratsDialog(won: value);
      },
    );
  }
}
