import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../crystal_rush_game.dart';
import 'player.dart';

class Crystal extends CircleComponent with CollisionCallbacks {
  Crystal({required Vector2 position}) {
    this.position = position;
    radius = GameConstants.crystalSize / 2;
  }
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    paint = Paint()..color = Color(GameConstants.crystalColor);
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    // Add floating animation
    position.y += (sin(DateTime.now().millisecondsSinceEpoch / 500.0) * 0.5);
  }

  @override
  bool onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other.runtimeType.toString() == 'Player') {
      final game = findGame()! as CrystalRushGame;
      game.collectCrystal(this);
      return false;
    }
    return true;
  }
}

