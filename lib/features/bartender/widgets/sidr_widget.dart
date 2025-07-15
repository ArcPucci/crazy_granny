import 'dart:math';

import 'package:crazy_granny/core/core.dart';
import 'package:crazy_granny/features/bartender/bartender.dart';
import 'package:crazy_granny/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidrWidget extends StatefulWidget {
  const SidrWidget({
    super.key,
    required this.onCompleted,
    this.selected = false,
    this.active = false,
    this.pulsing = true,
    this.onAdd,
    required this.onInit,
    this.onSelect,
  });

  final bool pulsing;
  final bool active;
  final bool selected;
  final void Function(VoidCallback?) onInit;
  final void Function(int coefficient) onCompleted;
  final VoidCallback? onAdd;
  final VoidCallback? onSelect;

  @override
  State<SidrWidget> createState() => _SidrWidgetState();
}

class _SidrWidgetState extends State<SidrWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _waveController;
  late AnimationController _fillingController;
  late Animation<double> fillingAnim;

  late AnimationController _waveHeightController;
  late Animation<double> waveAmplitudeAnim;

  Liquid liquid = ShortLiquid();
  double _percent = 0;
  bool _gameOver = false;
  bool _lose = false;
  bool _isAnimating = false;
  bool _showLight = false;

  static const step = 0.33;

  VoidCallback? _generate;

  @override
  void initState() {
    super.initState();
    _waveHeightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addListener(() => _generate?.call());

    waveAmplitudeAnim = Tween<double>(begin: 4.0, end: 0).animate(
      CurvedAnimation(
        parent: _waveHeightController,
        curve: Curves.easeOut,
      ),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _fillingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) setState(() {});
      });

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fillingAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fillingController,
        curve: const Interval(0, 1.0),
      ),
    );

    widget.onInit.call(_onTap);
  }

  @override
  void dispose() {
    _controller.dispose();
    _fillingController.dispose();
    _waveController.dispose();
    _waveHeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100.h,
          child: SizedBox(
            width: 60.w,
            height: 158.h,
            child: Stack(
              children: [
                Positioned(
                  height: liquid.height.h,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      final width = liquid.width.w;
                      final height = liquid.height.h;
                      return Transform.translate(
                        offset: Offset(
                          10.w,
                          -height +
                              104.h +
                              ((height + 213.h) * _controller.value) -
                              158.h,
                        ),
                        child: Image.asset(
                          liquid.asset,
                          width: width,
                          height: height,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 74.w,
          height: 320.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/png/dispensing_tap.png',
                width: 60.w,
                height: 104.h,
                fit: BoxFit.fill,
              ),
              widget.active
                  ? _lose
                      ? _buildLoseBody()
                      : _buildActiveBody()
                  : Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: PulsingPlace(
                        pulsing: widget.pulsing,
                        onTap: widget.onAdd,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActiveBody() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(
          'assets/png/glass_shadow.png',
          width: 71.w,
          height: 32.h,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 22.h),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (_showLight)
                Padding(
                  padding: EdgeInsets.only(bottom: 60.h),
                  child: Transform.translate(
                    offset: Offset(5.r, 0),
                    child: Transform.scale(
                      scale: 2.8,
                      child: Image.asset('assets/png/light.png'),
                    ),
                  ),
                ),
              ClipPath(
                clipper: GlassClipper(),
                child: SizedBox(
                  width: 74.r,
                  height: 116.r,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 36.r),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: AnimatedBuilder(
                        animation: Listenable.merge([
                          _fillingController,
                          _waveHeightController,
                          _waveController,
                        ]),
                        builder: (context, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomPaint(
                                size: Size(74.r, 60.r),
                                painter: WavePainter(
                                  waveHeight: waveAmplitudeAnim.value,
                                  progress: fillingAnim.value,
                                  wavePhase: _waveController.value * 2 * pi,
                                ),
                              ),
                              BubbleAnimation(
                                onInit: (value) => _generate = value,
                                drinkLevel: _fillingController.value,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: widget.onSelect,
                child: Stack(
                  children: [
                    Transform.scale(
                      scale: widget.selected ? 1.3 : 1,
                      child: Image.asset(
                        widget.selected
                            ? 'assets/png/glass_shadow_2.png'
                            : 'assets/png/glass.png',
                        width: 74.r,
                        height: 116.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                    if (_fillingController.isCompleted)
                      SizedBox(
                        width: 74.r,
                        height: 80.r,
                        child: Stack(
                          children: [
                            ...List.generate(
                              glassIndicators.length,
                              (index) {
                                final indicator = glassIndicators[index];
                                final bottom = 60.r * ((index) * step);
                                final hg = _percent >= (step * (index + 1));
                                return Transform.translate(
                                  offset: Offset(
                                    55.r,
                                    60.r - (bottom + 10.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Transform.scale(
                                        scale: 1.2,
                                        child: Image.asset(
                                          indicator.asset,
                                          width: 24.w,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      CustomStrokeText(
                                        text: '${indicator.coefficient}x',
                                        textStyle: AppTextStyles.no20.copyWith(
                                          color: hg ? indicator.color : null,
                                          shadows: [
                                            if (hg)
                                              BoxShadow(
                                                blurRadius: 10,
                                                color: indicator.dropShadow,
                                              ),
                                          ],
                                        ),
                                        strokeWidth: 1.sp,
                                        strokeColor: hg
                                            ? AppColors.yellow2
                                            : const Color(0xFF6A6A6A),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onTap() async {
    if (!widget.active) return;
    if (_isAnimating) return;
    if (_gameOver) return;

    _isAnimating = true;
    _controller.reset();
    _waveController.reset();
    _waveHeightController.reset();

    _waveController.repeat();

    final success = Random().nextBool();
    _gameOver = !success;

    _controller.forward().whenComplete(() async {
      if (!success) {
        await Future.delayed(const Duration(seconds: 1));
        _lose = true;
        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        widget.onCompleted.call(0);
        return;
      }

      if (_percent <= 0.4) {
        widget.onCompleted.call(2);
      } else if (_percent <= 0.7) {
        widget.onCompleted.call(5);
      } else {
        widget.onCompleted.call(10);
        _showLight = true;

        await Future.delayed(const Duration(seconds: 1));

        _showLight = false;
        if (!mounted) setState(() {});

        _gameOver = true;
      }
    });

    if (success) {
      _percent += step;
    } else {
      _percent += step / 2;
    }

    await _fillingController.animateTo(_percent).whenComplete(() async {
      await _waveHeightController.forward();
      _waveController.stop();
      _isAnimating = false;
    });
  }

  Widget _buildLoseBody() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.r),
      child: Container(
        width: 74.w,
        height: 37.h,
        decoration: BoxDecoration(
          color: const Color(0xFF676767).withValues(alpha: 0.41),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2.sp,
            color: Colors.white.withValues(alpha: 0.52),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          "Lose",
          style: AppTextStyles.no24.copyWith(fontSize: 24.r),
        ),
      ),
    );
  }
}
