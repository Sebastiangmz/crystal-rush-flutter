import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/services.dart';
import '../utils/constants.dart';
import 'components/player.dart';
import 'components/platform.dart';
import 'components/crystal.dart';
import 'systems/spawning_system.dart';
import 'systems/collision_system.dart';

class CrystalRushGame extends FlameGame
    with TapCallbacks, KeyboardCallbacks, CollisionCallbacks, HasCollisionDetection {
  
  late Player player;
  late SpawningSystem spawningSystem;
  late CollisionSystem collisionSystem;
  late CameraComponent gameCamera;
  
  int score = 0;
  double gameSpeed = 100.0;
  bool isGameRunning = false;
  
  final List<Platform> platforms = [];
  final List<Crystal> crystals = [];
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    // Set up camera
    gameCamera = CameraComponent.withFixedResolution(
      width: GameConstants.worldWidth,
      height: GameConstants.worldHeight,
    );
    gameCamera.viewfinder.visibleGameSize = size;
    add(gameCamera);
    
    // Initialize systems
    spawningSystem = SpawningSystem(this);
    collisionSystem = CollisionSystem(this);
    
    // Create player
    player = Player();
    add(player);
    
    // Add initial platforms
    _generateInitialPlatforms();
  }

  void _generateInitialPlatforms() {
    // Create starting platform
    final startPlatform = Platform(
      position: Vector2(GameConstants.worldWidth / 2 - GameConstants.platformWidth / 2, 
                       GameConstants.worldHeight - 100),
      width: GameConstants.platformWidth * 2,
    );
    platforms.add(startPlatform);
    add(startPlatform);
    
    // Add some initial platforms
    for (int i = 1; i < 5; i++) {
      final platform = Platform(
        position: Vector2(
          GameConstants.worldWidth / 2 - GameConstants.platformWidth / 2 + (i * GameConstants.platformSpacing),
          GameConstants.worldHeight - 100 - (i * 50),
        ),
      );
      platforms.add(platform);
      add(platform);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    if (isGameRunning) {
      // Update game speed
      gameSpeed += GameConstants.speedIncreaseRate * dt;
      gameSpeed = gameSpeed.clamp(0, GameConstants.maxGameSpeed);
      
      // Update systems
      spawningSystem.update(dt);
      collisionSystem.update(dt);
      
      // Move camera to follow player
      gameCamera.viewfinder.position = Vector2(player.position.x, 0);
      
      // Remove off-screen platforms and crystals
      _removeOffScreenObjects();
      
      // Check if player fell off screen
      if (player.position.y > GameConstants.worldHeight + 100) {
        gameOver();
      }
    }
  }

  void _removeOffScreenObjects() {
    final cameraLeft = gameCamera.viewfinder.position.x - GameConstants.worldWidth / 2;
    
    platforms.removeWhere((platform) {
      if (platform.position.x < cameraLeft - 200) {
        platform.removeFromParent();
        return true;
      }
      return false;
    });
    
    crystals.removeWhere((crystal) {
      if (crystal.position.x < cameraLeft - 200) {
        crystal.removeFromParent();
        return true;
      }
      return false;
    });
  }

  @override
  bool onTapDown(TapDownInfo info) {
    if (isGameRunning) {
      player.jump();
    }
    return true;
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.space) && isGameRunning) {
      player.jump();
      return true;
    }
    return false;
  }

  void startGame() {
    isGameRunning = true;
    score = 0;
    gameSpeed = 100.0;
    resumeEngine();
  }

  void reset() {
    isGameRunning = false;
    score = 0;
    gameSpeed = 100.0;
    
    // Reset player position
    player.reset();
    
    // Clear and regenerate platforms
    for (final platform in platforms) {
      platform.removeFromParent();
    }
    platforms.clear();
    
    for (final crystal in crystals) {
      crystal.removeFromParent();
    }
    crystals.clear();
    
    _generateInitialPlatforms();
    
    // Reset camera
    gameCamera.viewfinder.position = Vector2.zero();
  }

  void gameOver() {
    isGameRunning = false;
    pauseEngine();
  }

  void collectCrystal(Crystal crystal) {
    score += GameConstants.crystalValue;
    crystals.remove(crystal);
    crystal.removeFromParent();
  }

  void addPlatform(Platform platform) {
    platforms.add(platform);
    add(platform);
  }

  void addCrystal(Crystal crystal) {
    crystals.add(crystal);
    add(crystal);
  }
}