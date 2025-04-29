import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedCrazyGranny extends StatefulWidget {
  const AnimatedCrazyGranny({super.key});

  @override
  State<AnimatedCrazyGranny> createState() => _AnimatedCrazyGrannyState();
}

class _AnimatedCrazyGrannyState extends State<AnimatedCrazyGranny>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final list = [
    "assets/png/granny1.png",
    "assets/png/granny2.png",
    "assets/png/granny3.png",
    "assets/png/granny4.png",
    "assets/png/granny5.png",
    "assets/png/granny6.png",
    "assets/png/granny4.png",
    "assets/png/granny3.png",
    "assets/png/granny2.png",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((timeCall) {
      for (final path in list) {
        precacheImage(AssetImage(path), context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final index = (_controller.value * (list.length - 1)).round();
        return Image.asset(
          list[index],
          width: 297.w,
          height: 496.h,
          fit: BoxFit.fill,
        );
      },
    );
  }
}
