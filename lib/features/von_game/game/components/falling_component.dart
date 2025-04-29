import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../game.dart';

class FallingComponent extends SpriteComponent with HasGameRef<VonGame> {
  FallingComponent({super.position, super.size, required this.asset});

  final String asset;
  final int _speed = 150;

  bool _exploded = false;

  @override
  FutureOr<void> onLoad() async {
    priority = -1;
    position.y = gameRef.size.y * 0.2;
    sprite = await Sprite.load(asset);
    add(RectangleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_exploded) return;
    position.y += _speed * dt;

    if (position.y < gameRef.size.y * 0.8) return;

    gameRef.gameManager.addMiss();
    removeFromParent();
  }

  void onHit() {
    if (_exploded) return;
    add(BlastAnimation(removeFromParent));
    _exploded = true;
    if (!_exploded) gameRef.gameManager.addScore();
  }
}

class FallingFlower extends FallingComponent {
  FallingFlower({super.asset = 'falling_flower.png', super.position}) {
    super.size = Vector2(42, 57);
  }
}

class FallingNeedle extends FallingComponent {
  FallingNeedle({super.asset = 'falling_needle.png', super.position}) {
    super.size = Vector2(45, 52);
  }
}

class FallingShoes extends FallingComponent {
  FallingShoes({super.asset = 'falling_shoes.png', super.position}) {
    super.size = Vector2(48, 39);
  }
}

class FallingBooks extends FallingComponent {
  FallingBooks({super.asset = 'falling_books.png', super.position}) {
    super.size = Vector2(46, 44);
  }
}

class BlastAnimation extends SpriteAnimationComponent {
  final VoidCallback? onExploded;

  BlastAnimation(this.onExploded);

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(51, 51);
    await super.onLoad();
    final List<Sprite> sprites = [];

    for (int i = 1; i <= 5; i++) {
      sprites.add(await Sprite.load('animation/shot$i.png'));
    }

    animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 0.02,
      loop: false,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (animationTicker?.done() == true) {
      removeFromParent();
      onExploded?.call();
    }
  }
}
