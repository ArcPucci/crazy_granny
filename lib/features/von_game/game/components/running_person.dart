import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import '../game.dart';
import 'components.dart';

enum PlayerState { run, idle }

class RunningPerson extends SpriteAnimationGroupComponent
    with HasGameRef<VonGame>, CollisionCallbacks {
  final List<String> animationList;

  final int _speed = 120;

  RunningPerson({
    super.size,
    super.position,
    required this.animationList,
  });

  @override
  FutureOr<void> onLoad() async {
    priority = -1;
    final List<Sprite> runSprites = [];

    for (int i = 1; i < animationList.length; i++) {
      final image = await Sprite.load(animationList[i]);
      runSprites.add(image);
    }

    final runAnimation = SpriteAnimation.spriteList(
      runSprites,
      stepTime: 0.05,
    );

    final idleAnimation = SpriteAnimation.spriteList(
      [await Sprite.load(animationList[0])],
      stepTime: 0.05,
      loop: false,
    );

    animations = {
      PlayerState.run: runAnimation,
      PlayerState.idle: idleAnimation,
    };

    current = PlayerState.run;
    add(
      RectangleHitbox(
        size: Vector2(size.x / 2, size.y),
        position: Vector2(size.x / 4, 0),
      ),
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.gameManager.gamePaused) {
      if (current == PlayerState.run) _pauseAnimation();
      return;
    }

    if (current == PlayerState.idle) _continueAnimation();

    position.x += _speed * dt;
    if (position.x > gameRef.size.x) position.x = -size.x;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is! FallingComponent) return;
    other.onHit();
  }

  void _pauseAnimation() {
    current = PlayerState.idle;
  }

  void _continueAnimation() {
    current = PlayerState.run;
  }
}

class RunningBoy extends RunningPerson {
  RunningBoy({
    super.size,
    super.position,
    super.animationList = VonGameConfig.runningBoyFrames,
  }) {
    size = Vector2(65, 103);
  }

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    position = Vector2(0, gameRef.size.x - size.y * 1.5);
  }
}

class RunningGirl extends RunningPerson {
  RunningGirl({
    super.size,
    super.position,
    super.animationList = VonGameConfig.runningGirlFrames,
  }) {
    size = Vector2(65, 100);
  }

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    position = Vector2(-size.x * 3, gameRef.size.x - size.y * 1.5);
  }
}
