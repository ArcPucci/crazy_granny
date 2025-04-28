import 'dart:math';
import 'package:flame/components.dart';
import '../game.dart';

class ObjectsManager extends Component with HasGameRef<VonGame> {
  final List<CarComponent> _activeCars = [];

  final _startPosLeft1 = Vector2(-450, 0);
  final _startPosRight1 = Vector2(1450, 20);

  final _startPosLeft2 = Vector2(-50, 0);
  final _startPosRight2 = Vector2(1000, 20);

  @override
  void update(double dt) async {
    super.update(dt);

    for (final car in List<CarComponent>.from(_activeCars)) {
      if (car.isOffScreen(gameRef.size)) {
        car.removeFromParent();
        _activeCars.remove(car);
      }
    }

    if (_activeCars.length < 2) _spawnCar();
  }

  bool _enoughDistance(CarComponent lastCar) {
    final screenSize = gameRef.size;
    final screenArea = lastCar.bodySize.x;
    final movingToRight = lastCar.movingToRight;
    final isFlipped = lastCar.isFlipped;
    final position = lastCar.position;
    if (!movingToRight && !isFlipped) {
      return screenSize.x - position.x > screenArea;
    }

    if (movingToRight && isFlipped) return screenSize.x - position.x > 0;
    if (movingToRight && !isFlipped) return position.x > screenArea;
    if (!movingToRight && isFlipped) return position.x > screenArea;
    return true;
  }

  void _spawnCar() {
    final fromLeft = Random().nextBool();
    final isOrange = Random().nextBool();

    if (_activeCars.isNotEmpty && !_enoughDistance(_activeCars.last)) return;

    final baseCar = isOrange ? _getOrangeCar() : _getPurpleCar();

    final newCar = baseCar
      ..priority = fromLeft ? 0 : 1
      ..position += isOrange
          ? fromLeft
              ? _startPosLeft1.clone()
              : _startPosRight1.clone()
          : fromLeft
              ? _startPosLeft2.clone()
              : _startPosRight2.clone();

    if ((isOrange && !fromLeft) || (!isOrange && fromLeft)) {
      newCar.scale.x = -1;
    }

    add(newCar);
    _activeCars.add(newCar);
  }

  CarComponent _getOrangeCar() {
    return CarComponent(
      position: Vector2(0, 310),
      bodyAsset: 'orange_car.png',
      bodySize: Vector2(389, 112),
      leftWheelPosition: Vector2(82, 87),
      rightWheelPosition: Vector2(300, 87),
    );
  }

  CarComponent _getPurpleCar() {
    return CarComponent(
      position: Vector2(0, 290),
      movingToRight: false,
      bodyAsset: 'purple_car.png',
      bodySize: Vector2(375, 127),
      leftWheelPosition: Vector2(85, 105),
      rightWheelPosition: Vector2(285, 105),
    );
  }
}
