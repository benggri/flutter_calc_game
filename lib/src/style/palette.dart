import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Palette {
  Color get pen => const Color(0xff1d75fb);
  Color get darkPen => const Color(0xFF0050bc);
  Color get redPen => const Color(0xFFd10841);
  Color get inkFullOpacity => const Color(0xff352b42);
  Color get ink => const Color(0xee352b42);
  Color get backgroundMain => const Color(0xffd7d7d8);

  Color get buttonDefault => const Color(0xffffffff);
  Color get buttonPressed => const Color(0xffb2b2b2);
  Color get buttonShadow => const Color(0xff545454);
  Color get buttonBorder => const Color(0xFF000000);

  Color get backgroundPlaySession => const Color(0xffd7d7d8);

  Color get trueWhite => const Color(0xffffffff);
  Color get trueBlack => const Color(0xff000000);
  Color get textDark => const Color(0xff251607);
  Color get hitHeadItemBorder => const Color(0xFF000000);
  Color get mainBorder => const Color(0xFF915930);

  Color get timeForward => const Color(0xff69ff52);

  final Color _colorGray = const Color(0xFF915930);
  Color get colorGray => _colorGray;

  final Color _red          = const Color(0xffea4b4b);
  final Color _orange       = const Color(0xffea8d4b);
  final Color _yellow       = const Color(0xffffea00);
  final Color _deepGreen    = const Color(0xff4ede3d);
  final Color _green        = const Color(0xff80ea4b);
  final Color _skyBlue      = const Color(0xff4bddea);
  final Color _blue         = const Color(0xff4b90ea);
  final Color _navy         = const Color(0xff4b58ea);
  final Color _purple       = const Color(0xff984bea);
  final Color _pink         = const Color(0xffe37eee);


  Color get red => _red;
  Color get orange => _orange;
  Color get yellow => _yellow;
  Color get deepGreen => _deepGreen;
  Color get green => _green;
  Color get skyBlue => _skyBlue;
  Color get blue => _blue;
  Color get navy => _navy;
  Color get purple => _purple;
  Color get pink => _pink;


  final Color _red_shadow       = const Color(0xff9f2727);
  final Color _orange_shadow    = const Color(0xffb66c35);
  final Color _yellow_shadow    = const Color(0xffb4a61f);
  final Color _deepGreen_shadow = const Color(0xff2c8c22);
  final Color _green_shadow     = const Color(0xff6f9823);
  final Color _skyBlue_shadow   = const Color(0xff298a91);
  final Color _blue_shadow      = const Color(0xff235493);
  final Color _navy_shadow      = const Color(0xff2d369d);
  final Color _purple_shadow    = const Color(0xff58238d);
  final Color _pink_shadow      = const Color(0xff8e4294);

  List<Color> get getHitHeadGameColor       => [_red, _blue, _green];
  List<Color> get getHitHeadGameColorShadow => [_red_shadow, _blue_shadow, _green_shadow];

  List<Color> get getDefaultTimerColorList => [
    _yellow,
    _deepGreen,
    _green,
    _skyBlue,
    _blue,
    _navy,
    _purple,
    _pink,
    _red,
  ];

  List<Color> get getDefaultComboColor      => [
    _red,
    _orange,
    _yellow,
    _deepGreen,
    _green,
    _skyBlue,
    _blue,
    _navy,
    _purple,
    _pink,
  ];
}
