import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../game/game.dart';

class VonGamePage extends StatefulWidget {
  const VonGamePage({super.key});

  @override
  State<VonGamePage> createState() => _VonGamePageState();
}

class _VonGamePageState extends State<VonGamePage> {
  late final VonGame game;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    game = VonGame();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(844, 390),
      builder: (context, child) {
        return GameWidget(
          game: game,
          overlayBuilderMap: {
            "gameOverlay": (context, VonGame game) => GameOverlay(game),
            "gameOverOverlay": (context, VonGame game) => GameOverOverlay(game),
          },
          backgroundBuilder: (context) {
            return Image.asset(
              'assets/png/von_game_bg.png',
              fit: BoxFit.fill,
            );
          },
        );
      },
    );
  }
}
