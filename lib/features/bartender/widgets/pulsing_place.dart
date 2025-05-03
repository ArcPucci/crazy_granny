import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PulsingPlace extends StatefulWidget {
  const PulsingPlace({super.key, required this.pulsing, this.onTap});

  final bool pulsing;
  final VoidCallback? onTap;

  @override
  State<PulsingPlace> createState() => _PulsingPlaceState();
}

class _PulsingPlaceState extends State<PulsingPlace>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.6,
      upperBound: 1,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.pulsing) {
      return GestureDetector(
        onTap: widget.onTap,
        child: Image.asset(
          'assets/png/place.png',
          width: 84.w,
          height: 40.h,
        ),
      );
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _controller.value,
          child: Transform.scale(
            scale: 1.5,
            child: GestureDetector(
              onTap: widget.onTap,
              child: Image.asset(
                'assets/png/place_with_shadow.png',
                width: 84.w,
                height: 40.h,
              ),
            ),
          ),
        );
      },
    );
  }
}
