import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShootButton extends StatelessWidget {
  const ShootButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 131.r,
        height: 127.r,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/png/shoot_button.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 7),
              blurRadius: 7,
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
      ),
    );
  }
}
