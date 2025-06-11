import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class Player extends RectangleComponent with CollisionCallbacks {
  Vector2 velocity = Vector2.zero();
  bool isOnGround = false;
  bool canJump = true;
  late Vector2 startPosition;
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    size = Vector2(32, 48);
    startPosition = Vector2(GameConstants.worldWidth / 2 - size.x / 2, 
                           GameConstants.worldHeight - 200);
    position = startPosition.clone();
    
    paint = Paint()..color = Color(GameConstants.primaryColor);
    
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    // Apply gravity
    if (!isOnGround) {
      velocity.y += GameConstants.gravity * dt;
    }
    
    // Horizontal movement (constant forward movement)
    velocity.x = GameConstants.playerSpeed;
    
    // Update position
    position += velocity * dt;
    
    // Reset jump if on ground
    if (isOnGround && !canJump) {
      canJump = true;
    }
  }

  void jump() {
    if (isOnGround && canJump) {
      velocity.y = GameConstants.jumpForce;
      isOnGround = false;
      canJump = false;
    }
  }

  void landOnPlatform() {
    isOnGround = true;
    velocity.y = 0;
  }

  void reset() {
    position = startPosition.clone();
    velocity = Vector2.zero();
    isOnGround = false;
    canJump = true;
  }

  @override
  bool onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other.runtimeType.toString() == 'Platform') {
      // Check if player is falling onto the platform
      if (velocity.y > 0 && position.y < other.position.y) {
        position.y = other.position.y - size.y;
        landOnPlatform();
      }
    }
    return true;
  }

  @override
  bool onCollisionEnd(PositionComponent other) {
    if (other.runtimeType.toString() == 'Platform') {
      isOnGround = false;
    }
    return true;
  }
}