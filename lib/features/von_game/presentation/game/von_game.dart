import 'dart:async';

import 'package:flame/game.dart';
import 'game.dart';

class VonGame extends FlameGame {
  final ObjectsManager objectsManager = ObjectsManager();

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    overlays.add('gameOverlay');
    add(objectsManager);
  }
}
