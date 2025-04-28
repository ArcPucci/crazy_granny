import 'dart:async';

import 'package:crazy_granny/features/von_game/presentation/pages/von_game_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'features/features.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      runApp(
        ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) => const MyApp(),
        ),
      );
    },
    (error, stack) {
      print(error);
      print(stack);
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/onboardings',
          builder: (context, state) => const OnboardingPages(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const LivingRoomPage(),
          routes: [
            GoRoute(
              path: 'von_game',
              builder: (context, state) => const VonGamePage(),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

/*
* lib/
├── core/
│   └── error/, utils/, constants/
├── features/
│   └── home/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/ (реализация)
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/ (абстракции)
│       │   └── usecases/
│       └── presentation/
│           ├── bloc/ или provider/
│           └── screens/
└── main.dart*/
