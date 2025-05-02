import 'package:flutter/material.dart';
import '../../../shared/shared.dart';
import '../../features.dart';

class SlotGameProvider extends ChangeNotifier {
  SlotGameProvider({
    required AppDataProvider provider,
    required this.goToBonusGame,
    required this.showCongrats,
  }) : _provider = provider;

  final AppDataProvider _provider;
  final VoidCallback? goToBonusGame;
  final void Function(int coefficient, bool megaWin) showCongrats;

  VoidCallback? _spin;

  static const _step = 100;
  int _bet = _step;

  int get bet => _bet;

  int get coins => _provider.gameButtons;

  bool _canSpin = true;

  void onInit(VoidCallback? callBack) {
    _spin = callBack;
  }

  void spin() {
    if (_bet > coins) return;
    if (!_canSpin) return;

    _provider.addButtons(-_bet);
    _canSpin = false;
    _spin?.call();
  }

  void checkResult(List<List<SlotItem>> matrix) {
    final List<List<SlotItem>> temp = List.generate(
      matrix.length,
      (index) => [],
    );

    for (int i = 0; i < matrix.length; i++) {
      for (var item in matrix[i]) {
        if (item.isBig) {
          temp[i].addAll([EmptyCell(), EmptyCell(), EmptyCell()]);
          continue;
        }
        temp[i].add(item);
      }
    }

    int coefficient = _getMultiplier(temp);
    (bool, int) bonus = _checkBonusGame(matrix);

    final win = _bet * coefficient;
    final bonusWin = bonus.$2 * _bet;

    _provider.addButtons(win + bonusWin);

    if (bonus.$1) {
      goToBonusGame?.call();
    } else if (coefficient > 0) {
      showCongrats.call(win, coefficient >= 10);
    } else if (bonus.$2 > 0) {
      showCongrats.call(bonusWin, true);
    }

    _canSpin = true;
  }

  (bool, int) _checkBonusGame(List<List<SlotItem>> matrix) {
    final list = List.from(matrix.reduce((a, b) => a + b));
    final wildItems = list.whereType<WildItem>();
    final scatterItems = list.whereType<ScatterItem>();
    final coefficient = scatterItems.length == 3
        ? 10
        : scatterItems.length > 3
            ? 20
            : 0;

    return (wildItems.length >= 3, coefficient);
  }

  int _getMultiplier(List<List<SlotItem>> matrix) {
    for (int i = GameSlot.combinations.keys.length - 1; i >= 0; i--) {
      final comb = GameSlot.combinations.keys.toList()[i];
      bool next = true;
      SlotItem? lastItem;
      for (int x = 0; x < comb.length; x++) {
        for (int y = 0; y < comb[x].length; y++) {
          if (comb[x][y] == 0) continue;
          if (matrix[y][x] == EmptyCell()) {
            next = false;
            continue;
          }
          if (lastItem == null) {
            lastItem ??= matrix[y][x];
            continue;
          }
          if (matrix[y][x] != lastItem) {
            next = false;
            break;
          }
        }
        if (next && x == comb.length - 1) {
          return GameSlot.combinations[comb] ?? 0;
        }
        if (!next) break;
      }
    }

    return 0;
  }

  void increaseBet() {
    if (_bet + _step > coins) return;
    _bet += _step;
    notifyListeners();
  }

  void decreaseBet() {
    if (_bet < _step * 2) return;
    _bet -= _step;
    notifyListeners();
  }
}
