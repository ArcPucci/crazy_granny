import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../shared.dart';

class MiniGameAppBar extends StatelessWidget {
  const MiniGameAppBar({super.key, this.onTapInfo});

  final VoidCallback? onTapInfo;

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
          SizedBox(width: 7.w),
          SmallIconButton(
            asset: 'assets/png/icons/question.png',
            onTap: onTapInfo,
          ),
          const Spacer(),
          const MoneyCountWidget(),
        ],
      ),
    );
  }
}
