import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../shared.dart';

class GameMoneyDialog extends StatelessWidget {
  const GameMoneyDialog({super.key, this.appBar});

  final Widget? appBar;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 138.h,
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
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            GameShop.gameCurrencies.length,
                            (index) {
                              final currency = GameShop.gameCurrencies[index];
                              return GameButtonsShopCard(
                                quantity: currency.quantityString,
                                buttonText: '${currency.priceString} \$',
                                bestPrice: currency.bestPrice,
                                onTap: () {
                                  final provider = Provider.of<AppDataProvider>(
                                    context,
                                    listen: false,
                                  );

                                  provider.addButtons(currency.quantity);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 149.w,
                      height: 42.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/png/frames/frame2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: CustomStrokeText(
                        text: 'BUTTONS',
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
          appBar ??
              Positioned(
                top: 16.h,
                left: 0,
                right: 0,
                child: const Center(child: SafeArea(child: MainAppBar())),
              ),
        ],
      ),
    );
  }
}
