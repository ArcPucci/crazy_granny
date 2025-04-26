import 'dart:async';

import 'package:flame/components.dart';
import '../game.dart';

enum PlayerState { run }

class RunningBoy extends SpriteAnimationGroupComponent
    with HasGameRef<VonGame> {
  @override
  FutureOr<void> onLoad() async {
    size = VonGameConfig.runningBoySize;
    position = Vector2(0, gameRef.size.y - size.y * 1.55);

    final List<Sprite> runSprites = [];

    for (int i = 1; i < 10; i++) {
      final image = await Sprite.load('animation/boy/boy$i.png');
      runSprites.add(image);
    }

    final runAnimation = SpriteAnimation.spriteList(
      runSprites,
      stepTime: 0.08,
    );

    animations = {PlayerState.run: runAnimation};

    current = PlayerState.run;
    return super.onLoad();
  }
}
