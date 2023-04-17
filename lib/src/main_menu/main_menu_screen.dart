import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import 'package:flutter_calc_game/src/play/play_provider.dart';


import 'package:flutter_calc_game/src/style/component/menu_button.dart';
import 'package:flutter_calc_game/src/style/screen/stack_screen.dart';


Logger _log = Logger('main_menu_screen.dart');

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playService = context.watch<PlayProvider>();

    double containerSize = ((MediaQuery.of(context).size.width * 0.25 > 250) ? 250 : MediaQuery.of(context).size.width * 0.25);
    return StackScreen(
      title: '플러터 스터디 - 계산 게임',
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width:  containerSize,
                height: containerSize,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/default_icon.png')
                    )
                ),
              ),
              const Text('간단한 계산 게임', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              MenuButton(title: '플레이',
                onPressed: () {
                  playService.init();
                  GoRouter.of(context).go('/game_main');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}


