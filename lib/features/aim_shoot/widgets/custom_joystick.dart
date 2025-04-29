import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomJoystick extends StatefulWidget {
  const CustomJoystick({
    super.key,
    required this.onPanEnd,
    required this.onChanged,
  });

  final void Function(DragEndDetails) onPanEnd;
  final void Function(Offset) onChanged;

  @override
  State<CustomJoystick> createState() => _JoystickExampleState();
}

class _JoystickExampleState extends State<CustomJoystick> {
  Offset _stickPosition = Offset.zero;
  final double _baseRadius = 73.r;
  final double _stickRadius = 14.r;
  final double _borderSize = 10.sp;

  void _onPanStart(DragStartDetails details) {
    _updateStick(details.localPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _updateStick(details.localPosition);
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() => _stickPosition = Offset.zero);
    widget.onPanEnd(details);
  }

  void _updateStick(Offset offset) {
    final center = Offset(_baseRadius, _baseRadius);
    Offset delta = offset - center;

    if (delta.distance > (_baseRadius - _stickRadius)) {
      delta = Offset.fromDirection(
        delta.direction,
        _baseRadius - _stickRadius - _borderSize,
      );
    }

    Offset direction = _stickPosition / (_baseRadius - _stickRadius);

    setState(() => _stickPosition = delta);
    widget.onChanged(direction);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Container(
        width: _baseRadius * 2,
        height: _baseRadius * 2,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/png/joystick_bg.png'),
            fit: BoxFit.fill,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 7),
              blurRadius: 7,
              color: Colors.black.withValues(alpha: 0.2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: _baseRadius - _stickRadius + _stickPosition.dx,
              top: _baseRadius - _stickRadius + _stickPosition.dy,
              child: Container(
                width: _stickRadius * 2,
                height: _stickRadius * 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/png/ellipse.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
