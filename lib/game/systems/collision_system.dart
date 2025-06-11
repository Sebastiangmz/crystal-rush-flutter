import '../crystal_rush_game.dart';

class CollisionSystem {
  final CrystalRushGame game;
  
  CollisionSystem(this.game);

  void update(double dt) {
    // Collision detection is handled by Flame's collision system
    // This system can be used for additional collision logic
    // For example, checking if player is too far from platforms
    
    _checkPlayerBounds();
  }

  void _checkPlayerBounds() {
    final player = game.player;
    
    // Check if player is too far behind the camera
    final cameraLeft = game.gameCamera.viewfinder.position.x - game.size.x / 2;
    if (player.position.x < cameraLeft - 100) {
      game.gameOver();
    }
  }
}