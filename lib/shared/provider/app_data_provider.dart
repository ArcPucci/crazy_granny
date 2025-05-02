import 'package:flutter/material.dart';

import '../data/data.dart';

class AppDataProvider extends ChangeNotifier {
  final AppDataRepository _repository;

  AppDataProvider(this._repository) {
    init();
  }

  int _gameButtons = 0;

  int get gameButtons => _gameButtons;

  int _shoes = 0;

  int get shoes => _shoes;

  int _needles = 0;

  int get needles => _needles;

  int _books = 0;

  int get books => _books;

  int _flowers = 0;

  int get flowers => _flowers;

  int _bestScore = 0;

  int get bestScore => _bestScore;

  void init() {
    _gameButtons = _repository.receiveButtons();
    _shoes = _repository.receiveShoes();
    _needles = _repository.receiveNeedles();
    _books = _repository.receiveBooks();
    _flowers = _repository.receiveFlowers();
  }

  void addButtons(int value) async {
    _gameButtons += value;

    await _repository.updateButtons(_gameButtons);
    notifyListeners();
  }

  void getDailyReward() async {
    addButtons(2000);
    await _repository.setLastDailyReward();
  }

  void buyItem(ShopItem item) async {
    if (_gameButtons < item.price) return;
    addButtons(-item.price);

    switch (item.id) {
      case 0:
        _shoes++;
        await _repository.updateShoes(_shoes);
        break;
      case 1:
        _flowers++;
        await _repository.updateFlowers(_flowers);
        break;
      case 2:
        _books++;
        await _repository.updateBooks(_books);
        break;
      case 3:
        _needles++;
        await _repository.updateNeedles(_needles);
        break;
      default:
        break;
    }
  }

  void useItem(int id) async {
    switch (id) {
      case 0:
        _shoes--;
        await _repository.updateShoes(_shoes);
        break;
      case 1:
        _flowers--;
        await _repository.updateFlowers(_flowers);
        break;
      case 2:
        _books--;
        await _repository.updateBooks(_books);
        break;
      case 3:
        _needles--;
        await _repository.updateNeedles(_needles);
        break;
      default:
        break;
    }
  }

  Future<int> updateBestScore(int score) async {
    if (_bestScore > score) return _bestScore;
    _bestScore = score;
    await _repository.updateBestScore(_bestScore);
    return _bestScore;
  }
}
