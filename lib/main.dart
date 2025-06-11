import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'game/crystal_rush_game.dart';
import 'screens/menu_screen.dart';
import 'utils/constants.dart';

void main() {
  runApp(CrystalRushApp());
}

class CrystalRushApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crystal Rush',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GameWrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GameWrapper extends StatefulWidget {
  @override
  _GameWrapperState createState() => _GameWrapperState();
}

class _GameWrapperState extends State<GameWrapper> {
  late CrystalRushGame game;
  GameState currentState = GameState.menu;

  @override
  void initState() {
    super.initState();
    game = CrystalRushGame();
  }

  void startGame() {
    setState(() {
      currentState = GameState.playing;
    });
    game.startGame();
  }

  void pauseGame() {
    setState(() {
      currentState = GameState.paused;
    });
    game.pauseEngine();
  }

  void resumeGame() {
    setState(() {
      currentState = GameState.playing;
    });
    game.resumeEngine();
  }

  void gameOver() {
    setState(() {
      currentState = GameState.gameOver;
    });
  }

  void backToMenu() {
    setState(() {
      currentState = GameState.menu;
    });
    game.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: game),
          if (currentState == GameState.playing)
            _buildGameUI(),
          if (currentState == GameState.menu)
            MenuScreen(onStartGame: startGame),
          if (currentState == GameState.paused)
            _buildPauseOverlay(),
          if (currentState == GameState.gameOver)
            _buildGameOverOverlay(),
        ],
      ),
    );
  }

  Widget _buildGameUI() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Score: ${game.score}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Speed: ${(game.gameSpeed / 10).toInt()}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPauseOverlay() {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PAUSED',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: resumeGame,
              child: Text('RESUME'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: backToMenu,
              child: Text('MENU'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameOverOverlay() {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GAME OVER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Score: ${game.score}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: startGame,
              child: Text('PLAY AGAIN'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: backToMenu,
              child: Text('MENU'),
            ),
          ],
        ),
      ),
    );
  }
}