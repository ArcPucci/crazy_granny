import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/features.dart';
import '../shared.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key, this.onTapShop, this.onTapPlus});
  
  final VoidCallback? onTapShop;
  final VoidCallback? onTapPlus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 368.w,
      child: Row(
        children: [
          SizedBox(width: 10.w),
          MenuButton(text: "Shop", onTap: onTapShop),
          const Spacer(),
          MoneyCountWidget(onTapPlus: onTapPlus),
        ],
      ),
    );
  }
}
