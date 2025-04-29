import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils.dart';
import '../shared.dart';

class AnimatedImageWithText extends StatefulWidget {
  const AnimatedImageWithText({
    super.key,
    required this.text,
    required this.image,
    this.textPadding = EdgeInsets.zero,
    this.onTap,
    this.strokeColor,
    this.delay = 0,
    this.duration = 5,
  });

  final String text;
  final String image;
  final Color? strokeColor;
  final EdgeInsets textPadding;
  final VoidCallback? onTap;
  final int delay;
  final int duration;

  @override
  State<AnimatedImageWithText> createState() => _AnimatedImageWithTextState();
}

class _AnimatedImageWithTextState extends State<AnimatedImageWithText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(Duration(seconds: widget.delay), () {
      Future.doWhile(() async {
        if (!mounted) return false;
        await _controller.forward();
        await _controller.reverse();
        await Future.delayed(Duration(seconds: widget.duration));
        return true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              widget.image,
              width: 175.w,
              height: 125.h,
            ),
            Padding(
              padding: widget.textPadding,
              child: CustomStrokeText(
                text: widget.text,
                strokeWidth: 4.sp,
                textStyle: AppTextStyles.no26,
                strokeColor: widget.strokeColor ?? AppColors.orange2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
