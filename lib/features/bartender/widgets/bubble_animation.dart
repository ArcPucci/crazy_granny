import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bubble {
  final double x;
  final double width;
  final double height;
  final String asset;

  Bubble({
    required this.x,
    required this.width,
    required this.height,
    required this.asset,
  });
}

class Bubble1 extends Bubble {
  Bubble1({
    required super.x,
    super.width = 2,
    super.height = 2.7,
    super.asset = 'assets/png/bubble1.png',
  });
}

class Bubble2 extends Bubble {
  Bubble2({
    required super.x,
    super.width = 1.24,
    super.height = 1.6,
    super.asset = 'assets/png/bubble2.png',
  });
}

class BubbleAnimation extends StatefulWidget {
  final void Function(VoidCallback?) onInit;
  final double drinkLevel;

  const BubbleAnimation({
    super.key,
    required this.onInit,
    required this.drinkLevel,
  });

  @override
  _BubbleAnimationState createState() => _BubbleAnimationState();
}

class _BubbleAnimationState extends State<BubbleAnimation> {
  final List<Bubble> bubbles = [];
  final int bubbleCount = 30;

  final double glassWidth = 74.r;
  final double glassHeight = 60.r;

  @override
  void initState() {
    super.initState();
    widget.onInit.call(_generate);
  }

  void _generate() {
    final random = Random();
    final rand = random.nextBool();
    bubbles.add(rand
        ? Bubble1(x: random.nextDouble())
        : Bubble2(x: random.nextDouble()));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: glassWidth,
      height: glassHeight,
      child: Stack(
        children: bubbles.map((bubble) {
          double bubblePositionY = bubble.height +
              Random().nextDouble() * (glassHeight * widget.drinkLevel);
          if (bubblePositionY > glassHeight * widget.drinkLevel) {
            return const SizedBox.shrink();
          }

          return Positioned(
            left: bubble.x * glassWidth,
            bottom: bubblePositionY,
            child: Image.asset(
              bubble.asset,
              width: bubble.width,
              height: bubble.height,
              fit: BoxFit.fill,
            ),
          );
        }).toList(),
      ),
    );
  }
}
