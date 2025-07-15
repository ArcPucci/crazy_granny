import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../shared.dart';

class SimpleAppBar extends StatelessWidget {
  const SimpleAppBar({
    super.key,
    this.canTapPlus = true,
    this.onTapHome,
  });

  final bool canTapPlus;
  final VoidCallback? onTapHome;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 367.w,
      child: Row(
        children: [
          SizedBox(width: 5.w),
          SmallIconButton(
            asset: 'assets/png/icons/home.png',
            onTap: context.pop,
          ),
          const Spacer(),
          MoneyCountWidget(
            onTapPlus: () {
              if (!canTapPlus) return;
              _showShop(context);
            },
          ),
        ],
      ),
    );
  }

  void _showShop(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return GameMoneyDialog(
          appBar: Positioned(
            top: 5.h,
            left: 0,
            right: 0,
            child: const Center(child: SimpleAppBar(canTapPlus: false)),
          ),
        );
      },
    );
  }
}
