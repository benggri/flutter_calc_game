import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calc_game/src/style/palette.dart';

import 'package:flutter_calc_game/src/play/play_provider.dart';

import 'package:flutter_calc_game/src/play/components/question_button.dart';

class QuestionButtonList extends StatelessWidget {
  const QuestionButtonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            QuestionButton(idx: 0),
            QuestionButton(idx: 1),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            QuestionButton(idx: 2),
            QuestionButton(idx: 3),
          ],
        ),
      ],
    );
  }
}
