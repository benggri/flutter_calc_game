import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calc_game/src/style/palette.dart';

import 'package:flutter_calc_game/src/play/play_provider.dart';

import 'package:flutter_calc_game/src/play/components/question_button_list.dart';

import 'package:flutter_calc_game/src/style/screen/stack_screen.dart';


class GamePlay extends StatefulWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playProvider = context.watch<PlayProvider>();

    return StackScreen(
      title: '계산 게임',
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(playProvider.getQuestionStr, style: TextStyle(color: palette.textDark, fontSize: 20,),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      '정답 : ${playProvider.getCorrectCnt}',
                      style: TextStyle(color: palette.blue, fontSize: 20,),
                      key: ValueKey<String>('정답 : ${playProvider.getCorrectCnt}'),
                    )
                  ),
                  const SizedBox(width: 20,),
                  AnimatedSwitcher(
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      '오답 : ${playProvider.getWorngCnt}',
                      style: TextStyle(color: palette.red, fontSize: 20,),
                      key: ValueKey<String>('오답 : ${playProvider.getWorngCnt}'),
                    )
                  ),
                ],
              ),
              const QuestionButtonList(),
            ],
          ),
        ),
      ],
    );
  }
}