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
  late final FocusNode _focusNode;
  DateTime _lastShootTime = DateTime.now();
  late final Ticker _ticker;
  final double _aimSpeed = 150;
  Offset _direction = Offset.zero;
  Offset _aimPosition = Offset(122.r, 322.r);
  Duration _lastElapsed = Duration.zero;
  Offset _crosshairVelocity = Offset.zero;

  bool _canMove = true;

  final List<TargetModel> targets = [];

  @override
  void initState() {
    super.initState();
    targets.addAll(
      GrannyCollection.items.map((item) => TargetModel(item: item)).toList(),
    );
    _ticker = createTicker(_onTick);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ticker.start();
    });

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _ticker.stop();
    _ticker.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasSafeArea = MediaQuery.of(context).viewInsets.top > 0 ||
        MediaQuery.of(context).viewPadding.top > 0;
    final screenSizeDiff = hasSafeArea ? 0 : 30.h;
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
          ...targets.map((target) {
            final item = target.item;
            return Positioned(
              top: item.offset.dy + screenSizeDiff,
              left: item.offset.dx,
              child: SafeArea(
                child: AimTarget(
                  key: target.key,
                  item: item,
                  onInit: (explode) => target.explode = explode,
                  onCompleted: _showResult,
                ),
              ),
            );
          }),
          Positioned(
            top: _aimPosition.dy,
            left: _aimPosition.dx,
            child: SafeArea(
              child: Image.asset(
                'assets/png/aim.png',
                width: 98.r,
                height: 98.r,
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
      barrierDismissible: false,
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
    if (DateTime.now().difference(_lastShootTime) <
        const Duration(milliseconds: 300)) {
      return;
    }

    _lastShootTime = DateTime.now();

    final overlayBox =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final crosshairCenterGlobal = overlayBox.localToGlobal(
      _aimPosition + Offset(49.r, 49.r),
    );

    for (final target in targets) {
      final targetBox = target.key.currentContext?.findRenderObject();
      if (targetBox == null || !targetBox.attached) continue;

      final box = targetBox as RenderBox;
      final targetTopLeft = box.localToGlobal(Offset.zero);
      final targetCenter =
          targetTopLeft + Offset(box.size.width / 2, box.size.height / 2);

      final distance = (crosshairCenterGlobal - targetCenter).distance;

      if (distance <= 80.r) {
        target.explode?.call();
        break;
      }
    }
  }
}
