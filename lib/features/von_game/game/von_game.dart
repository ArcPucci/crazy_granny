import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'components/components.dart';
import 'game.dart';

class VonGame extends FlameGame with TapDetector, HasCollisionDetection {
  final ObjectsManager objectsManager = ObjectsManager();
  late final GameManager gameManager = GameManager(_endGame);

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    overlays.add('gameOverlay');
    add(RunningBoy());
    add(RunningGirl());
    add(objectsManager);
    add(gameManager);
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    if (gameManager.gamePaused) return;
    final temp = children.whereType<FallingComponent>().toList();
    if (temp.isNotEmpty) return;
    final position = info.eventPosition.global;
    final fallingItem = FallingFlower(position: position);
    add(fallingItem);
  }

  void restartGame() {}

  void _endGame() {
    overlays.add('gameOverOverlay');
  }
}
