# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Crystal Rush** - A 2D Flutter mobile game featuring an endless runner/collector gameplay where players jump between platforms, collect crystals, and avoid obstacles. Built using the Flame game engine for optimal 2D performance.

## Development Commands

```bash
# Project setup
flutter create crystal_rush .
flutter pub get

# Development
flutter run                    # Run on connected device/emulator
flutter run -d chrome          # Run in web browser for testing
flutter run --hot               # Enable hot reload

# Building
flutter build apk              # Android APK
flutter build appbundle        # Android App Bundle (for Play Store)
flutter build ios             # iOS build (requires macOS)

# Testing
flutter test                   # Run all tests
flutter test test/game/        # Run game-specific tests
flutter test --coverage       # Generate coverage report

# Code quality
flutter analyze               # Static analysis
dart format lib/ test/        # Format code
```

## Architecture Overview

### Game Engine Structure
- **Flame Framework**: Primary 2D game engine handling sprites, animations, and game loops
- **Component-Entity Pattern**: Game objects (player, platforms, enemies) as separate components
- **Game State Management**: Centralized state handling for menus, gameplay, and settings

### Core Game Systems
- **Spawning System**: Procedural generation of platforms, crystals, and obstacles
- **Physics System**: Collision detection, gravity, and movement mechanics
- **Progression System**: XP, leveling, currency, and unlockables
- **Audio System**: Background music, sound effects, and audio management

### Key Dependencies
```yaml
flame: ^1.10.0           # 2D game engine
flame_audio: ^2.0.0      # Audio management
shared_preferences: ^2.0.0  # Local storage
google_mobile_ads: ^3.0.0   # Monetization
firebase_core: ^2.0.0       # Analytics/Crashlytics
```

### File Organization
```
lib/
├── main.dart                 # App entry point
├── game/
│   ├── crystal_rush_game.dart   # Main game class
│   ├── components/              # Game entities (player, enemies, etc.)
│   └── systems/                 # Game logic systems
├── screens/                     # UI screens (menu, shop, settings)
├── services/                    # External services (audio, storage, ads)
└── utils/                       # Constants and helpers
```

### Game Mechanics Implementation
- **Progressive Difficulty**: Speed and spawn rates increase based on score/time
- **Power-up System**: Temporary abilities with visual indicators and timers
- **Collection Mechanics**: Crystal gathering with particle effects and score feedback
- **Daily Challenges**: Time-based objectives stored locally with reset logic

### Monetization Strategy
- **Rewarded Video Ads**: Optional ads for power-ups, extra lives, and currency
- **Cosmetic IAPs**: Character skins, particle trails, and visual customizations
- **Battle Pass**: Seasonal progression system with free and premium tiers

### Performance Considerations
- **Sprite Batching**: Efficient rendering of multiple similar objects
- **Object Pooling**: Reuse game objects to minimize garbage collection
- **Audio Preloading**: Cache frequently used sound effects
- **Responsive Design**: Adapt to different screen sizes and aspect ratios

### Testing Strategy
- **Unit Tests**: Game logic, scoring system, and progression mechanics
- **Widget Tests**: UI screens and game overlays
- **Integration Tests**: Full gameplay sessions and state transitions
- **Performance Tests**: Frame rate stability and memory usage monitoring