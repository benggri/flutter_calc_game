import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calc_game/src/style/palette.dart';

import 'package:flutter_calc_game/src/style/screen/model/default_screen_model.dart';

class StackScreen extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const StackScreen({
    required this.title,
    required this.children,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    AppBar appBar = AppBar(
      iconTheme: IconThemeData(color: palette.textDark),
      centerTitle: true,
      title: Text(title, style: TextStyle(color: palette.textDark, fontWeight: FontWeight.bold),),
      backgroundColor: palette.backgroundPlaySession,
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: palette.backgroundPlaySession,
      body: Center(
        child: Stack(
          children: children,
        ),
      ),
    );
  }
}
