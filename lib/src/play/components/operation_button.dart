import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calc_game/src/style/palette.dart';

import 'package:flutter_calc_game/src/play/play_provider.dart';

class OperationButton extends StatefulWidget {
  final int idx;

  const OperationButton({
    required this.idx,
    super.key,
  });

  @override
  State<OperationButton> createState() => _OperationButtonState();
}

class _OperationButtonState extends State<OperationButton> with SingleTickerProviderStateMixin {

  late double _scale;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - animationController.value;
    double contextWidth  = MediaQuery.of(context).size.width;
    double contextHeight = (MediaQuery.of(context).size.height - AppBar().preferredSize.height - kBottomNavigationBarHeight);

    double mainWidth  = contextWidth * 0.96;
    double itemWidth  = mainWidth * 0.5;
    double itemHeight = contextHeight * 0.2;
    double itemSize   = (itemWidth > itemHeight) ? itemHeight : itemWidth;

    final palette      = context.watch<Palette>();
    final playProvider = context.watch<PlayProvider>();

    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        animationController.forward();
      },
      onTapUp: (TapUpDetails details) {
        animationController.reverse().whenComplete(() {
          setState(() {
            playProvider.setSelectedCalcModelIdx = widget.idx;
            playProvider.createQuestion();
            GoRouter.of(context).go('/game_play');
          });
        });
      },
      child: Transform.scale(
        scale: _scale,
        child: Container(
          margin : const EdgeInsets.all(5.0),
          width  : itemSize,
          height : itemSize,
          decoration : BoxDecoration(
            borderRadius : BorderRadius.circular(itemSize * 0.125),
            border       : Border.all(width: 3.0, color: palette.buttonBorder),
            color        : palette.trueWhite,
          ),
          child : Center(
            child : Text(
              playProvider.getCalcModel[widget.idx].label,
              style: TextStyle(
                  color: palette.textDark,
                  fontSize: itemSize * 0.4,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }

}
