import 'package:crazy_granny/shared/provider/provider.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

class GameManager extends Component {
  GameManager(this.onGameOver, this._provider) {
    init();
  }

  final VoidCallback? onGameOver;

  final AppDataProvider _provider;

  ValueNotifier<int> miss = ValueNotifier(0);
  ValueNotifier<int> score = ValueNotifier(0);

  int _bestScore = 0;

  int get bestScore => _bestScore;

  ValueNotifier<int> shoesCount = ValueNotifier(10);
  ValueNotifier<int> flowersCount = ValueNotifier(10);
  ValueNotifier<int> booksCount = ValueNotifier(10);
  ValueNotifier<int> needlesCount = ValueNotifier(10);

  bool get hasItems =>
      shoesCount.value > 0 ||
      flowersCount.value > 0 ||
      booksCount.value > 0 ||
      needlesCount.value > 0;

  bool _gamePaused = false;

  bool get gamePaused => _gamePaused;

  void init() {
    shoesCount.value = _provider.shoes;
    flowersCount.value = _provider.flowers;
    booksCount.value = _provider.books;
    needlesCount.value = _provider.needles;
    _bestScore = _provider.bestScore;
  }

  void addScore() {
    score.value += 200;
    _provider.addButtons(200);
  }

  void addMiss() async {
    miss.value++;
    if (miss.value == 3) {
      pauseGame();
      _bestScore = await _provider.updateBestScore(score.value);
      onGameOver?.call();
      return;
    }
  }

  void pauseGame() {
    _gamePaused = true;
  }

  void continueGame() {
    _gamePaused = false;
    init();
  }

  int useItem() {
    if (shoesCount.value > 0) {
      shoesCount.value--;
      _provider.useItem(0);
      return 0;
    } else if (flowersCount.value > 0) {
      flowersCount.value--;
      _provider.useItem(1);
      return 1;
    } else if (booksCount.value > 0) {
      booksCount.value--;
      _provider.useItem(2);
      return 2;
    } else if (needlesCount.value > 0) {
      needlesCount.value--;
      _provider.useItem(3);
      return 3;
    }

    return 0;
  }
}
