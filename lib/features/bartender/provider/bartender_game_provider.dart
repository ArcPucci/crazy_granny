import 'package:crazy_granny/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../features.dart';

class BartenderGameProvider extends ChangeNotifier {
  BartenderGameProvider(this._provider, this._showCongrats);

  final AppDataProvider _provider;
  final void Function(int) _showCongrats;

  List<SidrModel> _sidrs = List.generate(5, (index) => SidrModel(id: index));

  List<SidrModel> get sidrs => _sidrs;

  int _selected = -1;

  int get selected => _selected;

  static const int _step = 100;

  int get coins => _provider.gameButtons;

  int _bet = _step;

  int get bet => _bet;

  bool _canAdd = true;

  bool _gameStarted = false;

  bool _canBet = false;

  bool get canBet => _canBet;

  bool get canFill => _selected != -1;

  bool get canTakeMoney => _selected != -1;

  bool _canSelect = true;

  void onAdd(int index) {
    if (coins < _step) return;
    if (!_canAdd) return;
    _gameStarted = true;
    _canBet = true;
    _sidrs[index].active = true;
    notifyListeners();
  }

  void onSelect(int index) {
    if (!_canSelect) return;
    if (_sidrs[index].lose) return;
    if (_sidrs[index].won) return;
    _selected = index;
    notifyListeners();
  }

  void fill() {
    if (_selected == -1) return;
    if (!_gameStarted) _gameStarted = true;
    if (_canAdd) _canAdd = false;
    _sidrs[_selected].fill?.call();
    _selected = -1;
    _canSelect = false;
    _canBet = false;
    notifyListeners();
  }

  void onCompleted(int index, int value) async {
    _canSelect = true;
    if (value == 0) {
      _sidrs[index].lose = true;
      notifyListeners();

      final empty = _sidrs.every((e) => !e.active || e.lose);
      if (!empty) return;

      _provider.addButtons(-bet);
      await Future.delayed(const Duration(seconds: 1));
      _reset();
      return;
    }

    _sidrs[index].bet = value;

    if (value == 10) {
      _sidrs[index].won = true;

      _provider.addButtons(_bet * 10);
      _showCongrats(bet);

      notifyListeners();
      return;
    }

    notifyListeners();
  }

  void _reset() async {
    _selected = -1;
    _bet = _step;
    _canAdd = true;
    _gameStarted = false;
    _canBet = false;

    _sidrs.clear();
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    _sidrs = List.generate(5, (index) => SidrModel(id: index));
    notifyListeners();
  }

  void takeMoney() {
    if (_selected == -1) return;
    if (_sidrs[_selected].bet == 0) return;
    _sidrs[_selected].won = true;

    final won = _bet * _sidrs[_selected].bet;

    _provider.addButtons(won);
    _showCongrats(won);

    _selected = -1;
    notifyListeners();

    final empty = _sidrs.every((e) => !e.active || e.lose || e.won);
    if (!empty) return;

    _reset();
  }

  void increaseBet() {
    if (_bet + _step > coins) return;
    _bet += _step;
    notifyListeners();
  }

  void decreaseBet() {
    if (_bet - _step < _step) return;
    _bet -= _step;
    notifyListeners();
  }

  void onInit(int index, VoidCallback? fill) async {
    _sidrs[index].fill = fill;
  }
}
