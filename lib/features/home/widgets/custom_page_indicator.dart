import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    this.pageCount = 3,
    required this.pageIndex,
  });

  final int pageIndex;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) {
          final active = pageIndex == index;
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 4.w),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: active ? 14.r : 11.r,
              height: active ? 14.r : 11.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: active
                    ? const DecorationImage(
                        image: AssetImage('assets/png/yellow_circle.png'),
                        fit: BoxFit.fill,
                      )
                    : null,
                color: active ? null : Colors.white.withOpacity(0.55),
              ),
            ),
          );
        },
      ),
    );
  }
}
