import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils.dart';
import '../../features.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              itemCount: 3,
              physics: const ClampingScrollPhysics(),
              onPageChanged: (value) => setState(() => _pageIndex = value),
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return _buildPage1();
                  case 1:
                    return _buildPage2();
                  case 2:
                    return _buildPage3();
                  default:
                    return _buildPage1();
                }
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 24.h,
            child: SafeArea(child: CustomPageIndicator(pageIndex: _pageIndex)),
          ),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/png/onboarding1.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 64.h,
          child: SafeArea(
            child: Column(
              children: [
                Image.asset(
                  'assets/png/title1.png',
                  width: 332.w,
                ),
                SizedBox(height: 12.h),
                Container(
                  width: 346.w,
                  height: 168.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/png/frame1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Are you used to the image\nof cute grannies knitting\nsocks and feeding cats?\nForget about it!",
                    style: AppTextStyles.mz500_24,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPage2() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/png/onboarding2.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 64.h,
          child: SafeArea(
            child: Column(
              children: [
                Image.asset(
                  'assets/png/title2.png',
                  width: 332.w,
                ),
                SizedBox(height: 12.h),
                Container(
                  width: 346.w,
                  height: 168.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/png/frame1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "During the day she\ngrumbles about the noise,\nand at night she lights up\nthe casino.",
                    style: AppTextStyles.mz500_24,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPage3() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/png/onboarding3.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 64.h,
          child: SafeArea(
            child: Column(
              children: [
                Image.asset(
                  'assets/png/title3.png',
                  width: 332.w,
                ),
                SizedBox(height: 12.h),
                Container(
                  width: 346.w,
                  height: 168.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/png/frame1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Become Granny's partner\nand help her cope with\nher \"daytime worries\" and\nnighttime adventures!",
                    style: AppTextStyles.mz500_24,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 18.h),
                const SimpleButton(text: "START"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
