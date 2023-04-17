import 'package:flutter/material.dart';
import 'package:flutter_calc_game/src/play/components/operation_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calc_game/src/style/palette.dart';

import 'package:flutter_calc_game/src/play/play_provider.dart';

class OperationButtonList extends StatelessWidget {
  const OperationButtonList({Key? key}) : super(key: key);

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
            OperationButton(idx: 0),
            OperationButton(idx: 1),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            OperationButton(idx: 2),
            OperationButton(idx: 3),
          ],
        ),
      ],
    );
  }
}
