import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calc_game/src/ads/ads_controller.dart';
import 'package:flutter_calc_game/src/in_app_purchase/in_app_purchase.dart';

import 'package:flutter_calc_game/src/style/palette.dart';
import 'package:flutter_calc_game/src/style/my_transition.dart';

import 'package:flutter_calc_game/src/main_menu/main_menu_screen.dart';

import 'package:flutter_calc_game/src/play/game_main.dart';
import 'package:flutter_calc_game/src/play/game_play.dart';
import 'package:flutter_calc_game/src/play/play_provider.dart';

Future<void> main() async {
  guardedMain();
}

void guardedMain() {
  if (kReleaseMode) {
    Logger.root.level = Level.WARNING;
  }

  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
  });

  WidgetsFlutterBinding.ensureInitialized();

  _log.info('Going full screen');
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );


  AdsController? adsController; // 광고 컨트롤러
  if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
    adsController = AdsController(MobileAds.instance);
    adsController.initialize();
  }
  InAppPurchaseController? inAppPurchaseController; // 인앱결제 컨트롤러

  PlayProvider? playProvider; // 게임 서비스

  runApp(
    MyApp(
      adsController: adsController, // 광고 컨트롤러
      inAppPurchaseController: inAppPurchaseController, // 인앱결제 컨트롤러
      playProvider: playProvider, // 게임 서비스
    ),
  );
}

Logger _log = Logger('main.dart');

class MyApp extends StatelessWidget {
  static final _router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const MainMenuScreen(key: Key('main_menu')),
          routes: [
            GoRoute(
              path: 'game_main',
              pageBuilder: (context, state) => buildMyTransition<void> (
                duration: 300,
                child: const GameMain(key: Key('game_main')),
                color: context.watch<Palette>().backgroundPlaySession,
              ),
            ),
            GoRoute(
              path: 'game_play',
              pageBuilder: (context, state) => buildMyTransition<void> (
                duration: 300,
                child: const GamePlay(key: Key('game_play')),
                color: context.watch<Palette>().backgroundPlaySession,
              ),
            ),
          ]
      ),
    ],
  );

  final AdsController? adsController; // 광고 컨트롤러
  final InAppPurchaseController? inAppPurchaseController; // 인앱결제 컨트롤러

  final PlayProvider? playProvider; // 게임 서비스

  const MyApp({
    required this.adsController, // 광고 컨트롤러
    required this.inAppPurchaseController, // 인앱결제 컨트롤러
    required this.playProvider, // 게임 서비스
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AdsController?>.value(value: adsController), // 광고 컨트롤러
        ChangeNotifierProvider<InAppPurchaseController?>.value(value: inAppPurchaseController), // 인앱결제 컨트롤러
        ChangeNotifierProvider(create: (_) => PlayProvider(),), // 게임 서비스
        Provider(create: (context) => Palette(),),
      ],
      child: Builder(builder: (context) {
        final palette = context.watch<Palette>();

        return MaterialApp.router(
          title: '플러터 스터디',
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!,
            );
          },
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: palette.darkPen,
              background: palette.backgroundMain,
            ),
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                color: palette.ink,
              ),
            ),
          ),
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          scaffoldMessengerKey: GlobalKey(debugLabel: 'scaffoldMessengerKey'),
        );
      }),
    );
  }
}
