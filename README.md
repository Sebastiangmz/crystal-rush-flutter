# Crystal Rush 💎

A fast-paced 2D endless runner game built with Flutter and Flame engine. Jump between platforms, collect crystals, and survive as long as possible in this addictive mobile game!

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Game-Flame-orange?style=for-the-badge" alt="Flame">
</p>

## 🎮 Game Features

- **Endless Runner Gameplay**: Auto-scrolling adventure with increasing difficulty
- **Simple Touch Controls**: Tap to jump between platforms
- **Crystal Collection**: Gather purple crystals to increase your score
- **Progressive Difficulty**: Game speed increases as you survive longer
- **Physics-Based Movement**: Realistic gravity and collision detection
- **Responsive UI**: Clean menus with game state management
- **Mobile Optimized**: Designed specifically for mobile devices

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.10.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Android device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Sebastiangmz/crystal-rush-flutter.git
   cd crystal-rush-flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the game**
   ```bash
   flutter run
   ```

### Build for Release

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle (for Play Store):**
```bash
flutter build appbundle --release
```

## 🎯 How to Play

1. **Start the Game**: Tap the "PLAY" button from the main menu
2. **Jump**: Tap anywhere on the screen to make your character jump
3. **Collect Crystals**: Gather purple crystals floating above platforms
4. **Survive**: Don't fall off the screen or get left behind by the camera
5. **Score**: Your score increases with crystals collected and time survived

## 🏗️ Project Structure

```
lib/
├── main.dart                    # App entry point & UI wrapper
├── game/
│   ├── crystal_rush_game.dart   # Main game class with Flame engine
│   ├── components/              # Game entities
│   │   ├── player.dart         # Player character with physics
│   │   ├── platform.dart       # Platform objects with collision
│   │   └── crystal.dart        # Collectible crystal items
│   └── systems/                # Game logic systems
│       ├── spawning_system.dart # Procedural generation
│       └── collision_system.dart # Collision handling
├── screens/
│   └── menu_screen.dart        # Main menu interface
└── utils/
    └── constants.dart          # Game configuration constants
```

## 🛠️ Technical Implementation

### Core Technologies
- **Flutter**: Cross-platform mobile framework
- **Flame Engine**: 2D game engine for Flutter
- **Dart**: Programming language

### Game Architecture
- **Component-Entity System**: Modular game object design
- **State Management**: Clean separation of game states
- **Physics System**: Gravity, collision detection, and movement
- **Procedural Generation**: Dynamic platform and crystal spawning

### Performance Features
- **Efficient Rendering**: Optimized sprite handling
- **Memory Management**: Object cleanup and reuse
- **Responsive Design**: Adapts to different screen sizes
- **Smooth Gameplay**: 60fps target with optimized game loop

## 🎨 Game Mechanics

### Progressive Difficulty
- Game speed increases gradually over time
- Platform spacing becomes more challenging
- Crystal placement requires more skill

### Scoring System
- **10 points** per crystal collected
- Score display during gameplay
- High score tracking (future feature)

### Physics & Controls
- **Gravity System**: Realistic falling mechanics
- **Jump Mechanics**: Touch-responsive jumping
- **Collision Detection**: Platform landing and crystal collection
- **Camera Following**: Smooth auto-scrolling

## 🔮 Future Enhancements

- [ ] **Power-ups**: Shield, magnet, double jump abilities
- [ ] **Character Customization**: Unlockable skins and trails
- [ ] **Audio System**: Background music and sound effects
- [ ] **Achievements**: Milestone-based rewards
- [ ] **Leaderboards**: Global and friend competitions
- [ ] **Daily Challenges**: Special objectives with rewards
- [ ] **Particle Effects**: Visual feedback for collections
- [ ] **Enemy System**: Obstacles and moving hazards

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📱 Platform Support

- ✅ **Android**: Fully supported
- 🔄 **iOS**: Ready for implementation
- 🔄 **Web**: Testable in browser
- 🔄 **Desktop**: Future consideration

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🎯 Development

Built with ❤️ using Flutter and Flame engine. Perfect for learning game development concepts and mobile app creation.

---

**Ready to collect some crystals?** 💎 [Download and play now!](https://github.com/Sebastiangmz/crystal-rush-flutter/releases)