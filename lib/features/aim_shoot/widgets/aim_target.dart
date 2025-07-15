import 'dart:math';

import 'package:crazy_granny/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AimTarget extends StatefulWidget {
  const AimTarget({
    super.key,
    required this.item,
    required this.onInit,
    required this.onCompleted,
  });

  final HighlightedItem item;
  final void Function(VoidCallback?) onInit;
  final void Function(bool hasButton) onCompleted;

  @override
  State<AimTarget> createState() => _AimTargetState();
}

class _AimTargetState extends State<AimTarget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final List<String> _shotFrames = List.generate(
    7,
    (index) => "assets/png/shot/shot${index + 1}.png",
  );

  final _frameSizes = [
    Size(45.w, 51.h),
    Size(73.w, 66.h),
    Size(87.w, 95.h),
    Size(125.w, 117.h),
    Size(129.w, 129.h),
    Size(119.w, 113.h),
    Size(132.w, 120.h),
  ];

  final _hasButton = Random().nextBool();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addListener(() {
        if (_controller.isCompleted) {
          setState(() => widget.onCompleted.call(_hasButton));
        }
      });
    widget.onInit.call(_controller.forward);
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.isCompleted && _hasButton) {
      final width =
          widget.item.size.width > 55.r ? widget.item.size.width : 55.r;
      final height =
          widget.item.size.height > 55.r ? widget.item.size.height : 55.r;

      return SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Image.asset(
            'assets/png/button_shadow.png',
            width: 55.r,
            height: 55.r,
            fit: BoxFit.fill,
          ),
        ),
      );
    }
    if (_controller.isCompleted) return const SizedBox();
    return SizedBox(
      width: widget.item.size.width,
      height: widget.item.size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            widget.item.asset,
            width: widget.item.size.width,
            height: widget.item.size.height,
            fit: BoxFit.fill,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final frame =
                  ((_shotFrames.length - 1) * _controller.value).round();
              final size = _frameSizes[frame];
              if (_controller.isDismissed) return const SizedBox();
              return Image.asset(
                _shotFrames[frame],
                width: size.width,
                height: size.height,
              );
            },
          ),
        ],
      ),
    );
  }
}
