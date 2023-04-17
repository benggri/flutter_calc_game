import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calc_game/src/style/palette.dart';

import 'package:flutter_calc_game/src/play/play_provider.dart';

import 'package:flutter_calc_game/src/play/components/operation_button_list.dart';

import 'package:flutter_calc_game/src/style/screen/stack_screen.dart';

class GameMain extends StatefulWidget {
  const GameMain({Key? key}) : super(key: key);

  @override
  State<GameMain> createState() => _GameMainState();
}

class _GameMainState extends State<GameMain> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double contextWidth  = MediaQuery.of(context).size.width;
    double contextHeight = (MediaQuery.of(context).size.height - AppBar().preferredSize.height - kBottomNavigationBarHeight);

    double mainWidth    = contextWidth * 0.96;
    double mainHeight   = contextHeight * 0.96 * 0.8;

    double subWidth     = contextWidth * 0.96;
    double subHeight    = contextHeight * 0.96 * 0.2;

    double itemWidth    = mainWidth * 0.5;
    double itemHeight   = contextHeight / 10;

    final palette = context.watch<Palette>();
    final playProvider = context.watch<PlayProvider>();

    return StackScreen(
      title: '계산 게임 메인',
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: itemWidth,
                child: Text('범위', style: TextStyle(color: palette.textDark, fontSize: 20,),),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: itemWidth,
                child: DropdownButton<int> (
                  value: playProvider.getSelectedRange,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down_rounded, size: 50,),
                  elevation: 30,
                  style: TextStyle(color: palette.textDark, fontSize: 20,),
                  underline: Container(
                    height: 2,
                    color: palette.textDark,
                  ),
                  items: [10,20,30,50,100].map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('~ $value'),
                    );
                  }).toList(),
                  onChanged: (int? value) {
                    setState(() {
                      playProvider.setSelectedRange = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: itemWidth,
                child: Text('계산 게임 종류', style: TextStyle(color: palette.textDark, fontSize: 20,),),
              ),
              const SizedBox(height: 20,),
              const OperationButtonList(),
            ],
          ),
        ),


      ],
    );
  }
}