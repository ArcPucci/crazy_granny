import 'dart:async';

import 'package:crazy_granny/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/features.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final preferencesInstance = await SharedPreferences.getInstance();
      final repository = AppDataRepository(preferencesInstance);

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      runApp(
        ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) => MyApp(repository: repository),
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
  const MyApp({super.key, required this.repository});

  final AppDataRepository repository;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/onboardings',
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
            GoRoute(
              path: 'bar_intro',
              builder: (context, state) => const BarIntroPage(),
            ),
            GoRoute(
              path: 'bar',
              builder: (context, state) => const BarPage(),
              routes: [
                GoRoute(
                  path: 'slot',
                  builder: (context, state) => const BarSlotPage(),
                  routes: [
                    GoRoute(
                      path: 'bonus',
                      builder: (context, state) => const AimShootPage(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'bartender',
                  builder: (context, state) => const BartenderGamePage(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: widget.repository),
        ChangeNotifierProvider(
          create: (_) => AppDataProvider(widget.repository),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}