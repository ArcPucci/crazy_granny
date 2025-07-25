import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/core.dart';
import '../../../../../shared/shared.dart';

class FallingItemsShopDialog extends StatefulWidget {
  const FallingItemsShopDialog({super.key});

  @override
  State<FallingItemsShopDialog> createState() => _FallingItemsShopDialogState();
}

class _FallingItemsShopDialogState extends State<FallingItemsShopDialog> {
  final controller = ScrollController();
  static final double _thumbHeight = 20.h;
  double _thumbPosition = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(_updateThumbPosition);
  }

  void _updateThumbPosition() {
    double maxScrollExtent = controller.position.maxScrollExtent;
    double viewHeight = controller.position.viewportDimension - 30.h;

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
                      padding: EdgeInsets.only(
                        top: 20.h,
                        left: 31.w,
                        right: 25.w,
                        bottom: 20.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            controller: controller,
                            child: Column(
                              children: List.generate(
                                GameShop.grannyItems.length,
                                (index) {
                                  final item = GameShop.grannyItems[index];
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: index == 0 ? 0 : 7.h,
                                    ),
                                    child: FallingItemShopCard(
                                      item: item,
                                      onBuy: () => _buy(item),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: _thumbPosition,
                                    right: 0,
                                    child: Container(
                                      width: 2.w,
                                      height: _thumbHeight,
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.white.withValues(alpha: 20),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                ],
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
                        text: 'SHOP',
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
            top: 22.h,
            right: 25.w,
            child: const MoneyCountWidget(),
          ),
        ],
      ),
    );
  }

  void _buy(ShopItem item) {
    final provider = Provider.of<AppDataProvider>(context, listen: false);
    provider.buyItem(item);
  }
}
