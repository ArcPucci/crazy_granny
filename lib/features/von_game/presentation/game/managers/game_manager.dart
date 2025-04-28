import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

class GameManager extends Component {
  GameManager(this.onGameOver);

  final VoidCallback? onGameOver;

  ValueNotifier<int> miss = ValueNotifier(0);
  ValueNotifier<int> score = ValueNotifier(0);

  ValueNotifier<int> shoesCount = ValueNotifier(10);
  ValueNotifier<int> flowersCount = ValueNotifier(10);
  ValueNotifier<int> booksCount = ValueNotifier(10);
  ValueNotifier<int> needlesCount = ValueNotifier(10);

  bool _gamePaused = false;

  bool get gamePaused => _gamePaused;

  void init() {}

  void addScore() {
    score.value += 200;
  }

  void addMiss() {
    miss.value++;
    if (miss.value == 3) {
      pauseGame();
      onGameOver?.call();
      return;
    }
  }

  void pauseGame() {
    _gamePaused = true;
  }

  void continueGame() {
    _gamePaused = false;
  }
}
