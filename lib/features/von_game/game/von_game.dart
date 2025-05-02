import 'dart:async';
import 'package:crazy_granny/shared/shared.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'components/components.dart';
import 'game.dart';

class VonGame extends FlameGame with TapDetector, HasCollisionDetection {
  VonGame(this.provider);

  final AppDataProvider provider;

  final ObjectsManager objectsManager = ObjectsManager();
  late final GameManager gameManager = GameManager(_endGame, provider);

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
    if (!gameManager.hasItems) return;
    if (gameManager.gamePaused) return;
    final temp = children.whereType<FallingComponent>().toList();
    if (temp.isNotEmpty) return;
    final position = info.eventPosition.global;
    final id = gameManager.useItem();
    final fallingItem = _getItem(id, position);
    add(fallingItem);
  }

  FallingComponent _getItem(int id, Vector2 pos) {
    return switch (id) {
      0 => FallingShoes(position: pos),
      1 => FallingFlower(position: pos),
      2 => FallingBooks(position: pos),
      3 => FallingNeedle(position: pos),
      _ => FallingShoes(position: pos),
    };
  }

  void restartGame() {
    overlays.remove('gameOverOverlay');
    gameManager.continueGame();
  }

  void _endGame() {
    overlays.add('gameOverOverlay');
  }
}
