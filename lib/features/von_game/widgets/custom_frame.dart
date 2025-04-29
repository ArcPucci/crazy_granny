import 'package:flutter/material.dart';

class CustomFrame extends StatelessWidget {
  const CustomFrame({
    super.key,
    required this.width,
    required this.height,
    required this.asset,
    this.padding,
    required this.child,
  });

  final double width;
  final double height;
  final String asset;
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.fill,
        ),
      ),
      padding: padding,
      alignment: Alignment.center,
      child: child,
    );
  }
}
