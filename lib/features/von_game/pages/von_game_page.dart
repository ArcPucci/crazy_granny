import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    game = VonGame(Provider.of(context, listen: false));
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
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
              width: 844.w,
              height: 390.h,
              fit: BoxFit.fill,
            );
          },
        );
      },
    );
  }
}
