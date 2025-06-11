import 'dart:math';
import 'package:flame/components.dart';
import '../crystal_rush_game.dart';
import '../components/platform.dart';
import '../components/crystal.dart';
import '../../utils/constants.dart';

class SpawningSystem {
  final CrystalRushGame game;
  final Random random = Random();
  
  double _platformSpawnTimer = 0;
  double _crystalSpawnTimer = 0;
  double _lastPlatformX = 0;
  
  static const double platformSpawnInterval = 2.0;
  static const double crystalSpawnInterval = 3.0;
  
  SpawningSystem(this.game) {
    _lastPlatformX = GameConstants.worldWidth / 2 + (4 * GameConstants.platformSpacing);
  }

  void update(double dt) {
    _platformSpawnTimer += dt;
    _crystalSpawnTimer += dt;
    
    if (_platformSpawnTimer >= platformSpawnInterval) {
      _spawnPlatform();
      _platformSpawnTimer = 0;
    }
    
    if (_crystalSpawnTimer >= crystalSpawnInterval) {
      _spawnCrystal();
      _crystalSpawnTimer = 0;
    }
  }

  void _spawnPlatform() {
    final cameraX = game.gameCamera.viewfinder.position.x;
    final spawnX = cameraX + GameConstants.worldWidth / 2 + 200;
    
    // Random Y position within reasonable jumping distance
    final minY = GameConstants.worldHeight - 400;
    final maxY = GameConstants.worldHeight - 100;
    final spawnY = minY + random.nextDouble() * (maxY - minY);
    
    final platform = Platform(
      position: Vector2(spawnX, spawnY),
      width: GameConstants.platformWidth + random.nextDouble() * 50,
    );
    
    game.addPlatform(platform);
    _lastPlatformX = spawnX;
  }

  void _spawnCrystal() {
    final cameraX = game.gameCamera.viewfinder.position.x;
    final spawnX = cameraX + GameConstants.worldWidth / 2 + 150 + random.nextDouble() * 200;
    
    // Spawn crystal above platforms
    final minY = GameConstants.worldHeight - 500;
    final maxY = GameConstants.worldHeight - 150;
    final spawnY = minY + random.nextDouble() * (maxY - minY);
    
    final crystal = Crystal(position: Vector2(spawnX, spawnY));
    game.addCrystal(crystal);
  }
}