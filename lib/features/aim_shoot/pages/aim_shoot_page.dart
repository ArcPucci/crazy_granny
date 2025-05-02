import 'package:crazy_granny/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../features.dart';

class AimShootPage extends StatefulWidget {
  const AimShootPage({super.key});

  @override
  State<AimShootPage> createState() => _AimShootPageState();
}

class _AimShootPageState extends State<AimShootPage>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  final double _aimSpeed = 150;
  Offset _direction = Offset.zero;
  Offset _aimPosition = Offset(122.w, 322.h);
  Duration _lastElapsed = Duration.zero;
  Offset _crosshairVelocity = Offset.zero;

  bool _canMove = true;

  final targets = List.generate(
    GrannyCollection.items.length,
    (index) => TargetModel(item: GrannyCollection.items[index]),
  );

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/png/aim_shoot_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          ...List.generate(
            targets.length,
            (index) {
              final item = targets[index].item;
              return Positioned(
                top: item.offset.dy,
                left: item.offset.dx,
                child: SafeArea(
                  child: AimTarget(
                    item: item,
                    onInit: (explode) => targets[index].explode = explode,
                    onCompleted: _showResult,
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: _aimPosition.dy,
            left: _aimPosition.dx,
            child: SafeArea(
              child: Image.asset(
                'assets/png/aim.png',
                width: 98,
                height: 98,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 5.h,
            left: 0,
            right: 0,
            child: Center(
              child: SafeArea(child: MiniGameAppBar(onTapInfo: _showInfo)),
            ),
          ),
          Positioned(
            left: 33.w,
            right: 30.w,
            bottom: 14.h,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomJoystick(onChanged: onChanged, onPanEnd: onPanEnd),
                  ShootButton(onTap: onShoot),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showInfo() {
    showDialog(
      context: context,
      builder: (context) {
        return const BonusGameInfoDialog();
      },
    );
  }

  void _showResult(bool won) {
    final value = won ? 5000 : 1000;
    Provider.of<AppDataProvider>(context, listen: false).addButtons(value);
    showDialog(
      context: context,
      builder: (context) {
        return GameResultDialog(won: won);
      },
    );
  }

  void onChanged(Offset offset) {
    _direction = offset;
    _canMove = true;
  }

  void _onTick(Duration elapsed) {
    if (!_canMove) return;
    final dt = (elapsed - _lastElapsed).inMilliseconds / 1000.0;
    _lastElapsed = elapsed;

    if (_direction.distanceSquared < 0.01) {
      _crosshairVelocity = Offset.zero;
    } else {
      _crosshairVelocity = _direction * _aimSpeed;
    }

    final screenSize = MediaQuery.of(context).size;
    const crosshairRadius = 49;
    final maxX = screenSize.width - crosshairRadius * 2;
    final maxY = screenSize.height - crosshairRadius * 3;

    final newPos = _aimPosition + _crosshairVelocity * dt;

    if (newPos.dx > maxX || newPos.dx < 0) return;
    if (newPos.dy > maxY || newPos.dy < 0) return;

    setState(() => _aimPosition += _crosshairVelocity * dt);
  }

  void onPanEnd(DragEndDetails dt) {
    setState(() => _crosshairVelocity = Offset.zero);
    _canMove = false;
  }

  void onShoot() {
    const double aimAssistRadius = 49;

    final screenSize = MediaQuery.of(context).size;
    final screenCenter = Offset(screenSize.width / 2, screenSize.height / 2);

    final crosshairGlobal = screenCenter + _aimPosition;

    for (final target in targets) {
      final targetGlobal = screenCenter + target.item.offset;
      final distance = (crosshairGlobal - targetGlobal).distance;
      print(distance);

      if (distance <= aimAssistRadius) {
        print('🎯 Попал в цель! Target: ${target.item.asset}');
        target.explode?.call();
      }
    }
  }
}
