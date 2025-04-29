import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

import '../game.dart';

class CarComponent extends PositionComponent with HasGameRef<VonGame> {
  final bool movingToRight;
  final String bodyAsset;
  final Vector2 bodySize;
  final Vector2 leftWheelPosition;
  final Vector2 rightWheelPosition;

  late SpriteComponent body;
  late WheelComponent leftWheel;
  late WheelComponent rightWheel;

  CarComponent({
    super.position,
    super.priority,
    this.movingToRight = true,
    required this.bodyAsset,
    required this.bodySize,
    required this.leftWheelPosition,
    required this.rightWheelPosition,
  });

  int carSpeed = 200;

  bool get isFlipped => scale.x == -1;

  @override
  Future<void> onLoad() async {
    body = SpriteComponent()
      ..sprite = await Sprite.load(bodyAsset)
      ..size = bodySize;

    leftWheel = WheelComponent(movingToRight)
      ..sprite = await Sprite.load('wheel.png')
      ..size = Vector2(65, 65)
      ..position = leftWheelPosition;

    rightWheel = WheelComponent(movingToRight)
      ..sprite = await Sprite.load('wheel.png')
      ..size = Vector2(65, 65)
      ..position = rightWheelPosition;

    add(body);
    add(leftWheel);
    add(rightWheel);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.gameManager.gamePaused) return;
    position.x +=
        (((movingToRight && !isFlipped) || (isFlipped && !movingToRight))
                ? carSpeed
                : -(carSpeed)) *
            dt;
  }

  bool isOffScreen(Vector2 screenSize) {
    if (!movingToRight && !isFlipped) return position.x < -bodySize.x;
    if (movingToRight && isFlipped) return position.x < 0;
    if (movingToRight && !isFlipped) return position.x > screenSize.x;
    if (!movingToRight && isFlipped) {
      return position.x > screenSize.x + bodySize.x;
    }
    return false;
  }
}

class WheelComponent extends SpriteComponent with HasGameRef<VonGame> {
  final bool spinningToRight;

  WheelComponent(this.spinningToRight);

  int spinningSpeed = 15;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    anchor = const Anchor(0.5, 0.51);

    final rand = Random().nextInt(360);
    angle = rand * pi / 180;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.gameManager.gamePaused) return;

    angle += (spinningToRight ? spinningSpeed : -(spinningSpeed)) * dt;
  }
}
