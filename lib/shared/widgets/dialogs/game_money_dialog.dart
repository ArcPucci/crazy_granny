import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: const GameShopBox(),
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
