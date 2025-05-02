import 'package:crazy_granny/features/bar/bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSpinSlot extends StatelessWidget {
  const CustomSpinSlot({super.key, this.onInit, this.onCompleted});

  final void Function(VoidCallback?)? onInit;
  final void Function(List<List<SlotItem>>)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 509.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/png/slot_rect.png'),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.only(top: 90.h),
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 250.r,
        height: 359.r,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/png/matrix_elements.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: -140.r,
              child: SlotMachine(
                onInit: onInit,
                items: GameSlot.items,
                onCompleted: onCompleted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
