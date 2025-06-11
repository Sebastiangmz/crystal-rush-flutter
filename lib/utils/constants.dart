class GameConstants {
  // Game settings
  static const double worldWidth = 800.0;
  static const double worldHeight = 600.0;
  static const double gravity = 980.0;
  static const double jumpForce = -400.0;
  static const double playerSpeed = 200.0;
  
  // Platform settings
  static const double platformWidth = 100.0;
  static const double platformHeight = 20.0;
  static const double platformSpacing = 150.0;
  
  // Crystal settings
  static const double crystalSize = 24.0;
  static const int crystalValue = 10;
  
  // Game progression
  static const double speedIncreaseRate = 10.0;
  static const double maxGameSpeed = 500.0;
  
  // Colors
  static const int primaryColor = 0xFF2196F3;
  static const int accentColor = 0xFFFF9800;
  static const int crystalColor = 0xFF9C27B0;
}

enum GameState {
  menu,
  playing,
  paused,
  gameOver,
}