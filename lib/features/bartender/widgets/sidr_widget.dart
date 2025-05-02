import 'dart:async';
import 'dart:ui' as ui;

import 'package:crazy_granny/features/bartender/bartender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidrWidget extends StatefulWidget {
  const SidrWidget({super.key});

  @override
  State<SidrWidget> createState() => _SidrWidgetState();
}

class _SidrWidgetState extends State<SidrWidget> {
  double fillPercent = 0.0;

  Future<ui.Image> loadUiImage(String url) async {
    final response = await rootBundle.load(url);
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(response.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        fillPercent = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74.w,
      height: 309.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/png/dispensing_tap.png',
            width: 54.w,
            height: 104.h,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipPath(
                clipper: GlassClipper(),
                child: Container(
                  width: 74.r,
                  height: 116.r,
                  color: Colors.blue,
                ),
              ),
              // Image.asset(
              //   'assets/png/glass.png',
              //   width: 74.r,
              //   height: 116.r,
              //   fit: BoxFit.fill,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
