import 'package:crazy_granny/features/bar/bar.dart';
import 'package:crazy_granny/features/bartender/bartender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
                        top: 14.h,
                        left: 42.w,
                        child: SizedBox(
                          width: 110.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallIconButton(
                                asset: 'assets/png/icons/home.png',
                                onTap: context.pop,
                              ),
                              SmallIconButton(
                                asset: 'assets/png/icons/question.png',
                                onTap: () {},
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
                                const BetCountWidget(bet: 1000),
                                const Spacer(),
                                Image.asset(
                                  'assets/png/button/active_drop.png',
                                  width: 83.w,
                                  height: 70.h,
                                ),
                                SizedBox(width: 14.w),
                                Image.asset(
                                  'assets/png/button/active_hand.png',
                                  width: 83.w,
                                  height: 70.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        child: SidrWidget(),
                      ),
                      Positioned(
                        top: 14.h,
                        right: 27.w,
                        child: const MoneyCountWidget(),
                      ),
                    ],
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
