import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class Platform extends RectangleComponent with CollisionCallbacks {
  Platform({
    required Vector2 position,
    double width = GameConstants.platformWidth,
    double height = GameConstants.platformHeight,
  }) {
    this.position = position;
    size = Vector2(width, height);
  }
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    paint = Paint()..color = Color(GameConstants.accentColor);
    add(RectangleHitbox());
  }
}