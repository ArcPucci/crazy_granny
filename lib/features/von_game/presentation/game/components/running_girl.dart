import 'dart:async';

import 'package:flame/components.dart';
import '../game.dart';
import 'running_boy.dart';

class RunningGirl extends SpriteAnimationGroupComponent
    with HasGameRef<VonGame> {
  @override
  FutureOr<void> onLoad() async {
    final List<Sprite> runSprites = [];

    size = VonGameConfig.runningGirlSize;
    position = Vector2(100, gameRef.size.y - size.y * 1.55);

    for (int i = 1; i <= 10; i++) {
      final image = await Sprite.load('animation/girl/girl$i.png');
      runSprites.add(image);
    }

    final runAnimation = SpriteAnimation.spriteList(
      runSprites,
      stepTime: 0.07,
    );

    animations = {PlayerState.run: runAnimation};

    current = PlayerState.run;
    return super.onLoad();
  }
}
