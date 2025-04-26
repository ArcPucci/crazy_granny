import 'dart:async';

import 'package:crazy_granny/features/von_game/presentation/pages/von_game_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/features.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const VonGamePage(),
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
