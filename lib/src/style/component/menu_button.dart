import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calc_game/src/style/palette.dart';

class MenuButton extends StatefulWidget {
  final String title;
  final Function() onPressed;
  final IconData? icon;
  final double? width;
  final double? height;

  const MenuButton({
    required this.title,
    required this.onPressed,
    this.icon,
    this.width,
    this.height,
    super.key,
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> with SingleTickerProviderStateMixin {

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
    final palette = context.watch<Palette>();

    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: _animationButton(palette),
    );
  }

  Widget _animationButton(Palette palette) {
    double _width  = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height * 0.9 - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 30;

    double defaultHeight = widget.height ?? ((_height * 0.1 >  60) ?  60 : _height * 0.1);
    double defaultWidth  = widget.width  ?? ((_width  * 0.5 > 300) ? 300 : _width  * 0.5);


    return Transform.scale(
      scale: _scale,
      child: Container(
        height: defaultHeight,
        width : defaultWidth,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.circular(defaultHeight * 0.25),
          border       : Border.all(width: 3.0, color: palette.buttonBorder),
          color        : palette.trueWhite,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
              child: Icon(widget.icon ?? Icons.audiotrack, color: palette.textDark),
            ),
            const SizedBox(width: 5,),
            Text(widget.title, style: TextStyle(color: palette.textDark,fontSize: 15,height: 1),),
          ],
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    animationController.forward();
  }
  void _tapUp(TapUpDetails details) {
    animationController.reverse().whenComplete(() {
      widget.onPressed();
    });
  }

}
