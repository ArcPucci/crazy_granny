import 'package:crazy_granny/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDataRepository {
  AppDataRepository(this._preferences);

  final SharedPreferences _preferences;

  static const _gameButtonsKey = "GAME_BUTTONS";
  static const _shoesKey = "SHOES";
  static const _needlesKey = "NEEDLES";
  static const _flowersKey = "FLOWERS";
  static const _booksKey = "BOOKS";
  static const _lastDailyRewardDateKey = "LAST_DAILY_REWARD_DATE";
  static const _bestScoreKey = "BEST_SCORE";

  Future<void> updateButtons(int count) async {
    await _preferences.setInt(_gameButtonsKey, count);
  }

  int receiveButtons() {
    return _preferences.getInt(_gameButtonsKey) ?? 1000;
  }

  Future<void> updateShoes(int count) async {
    await _preferences.setInt(_shoesKey, count);
  }

  int receiveShoes() {
    return _preferences.getInt(_shoesKey) ?? 10;
  }

  Future<void> updateNeedles(int count) async {
    await _preferences.setInt(_needlesKey, count);
  }

  int receiveNeedles() {
    return _preferences.getInt(_needlesKey) ?? 10;
  }

  Future<void> updateFlowers(int count) async {
    await _preferences.setInt(_flowersKey, count);
  }

  int receiveFlowers() {
    return _preferences.getInt(_flowersKey) ?? 10;
  }

  Future<void> updateBooks(int count) async {
    await _preferences.setInt(_booksKey, count);
  }

  int receiveBooks() {
    return _preferences.getInt(_booksKey) ?? 10;
  }

  Future<void> setLastDailyReward() async {
    final date = DateTime.now().withZeroTime;
    final temp = date.microsecondsSinceEpoch;
    await _preferences.setInt(_lastDailyRewardDateKey, temp);
  }

  Future<bool> getLastDailyReward() async {
    final temp = _preferences.getInt(_lastDailyRewardDateKey) ?? 0;
    DateTime? date;

    if (temp != 0) date = DateTime.fromMicrosecondsSinceEpoch(temp);
    final currentDate = DateTime.now().withZeroTime;

    final hasReward = date != currentDate;
    return hasReward;
  }

  Future<void> updateBestScore(int value) async {
    await _preferences.setInt(_bestScoreKey, value);
  }

  int receiveBestScore() {
    return _preferences.getInt(_bestScoreKey) ?? 0;
  }
}
