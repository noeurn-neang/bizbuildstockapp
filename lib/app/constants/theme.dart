import 'package:flutter/material.dart';
import 'package:flutter_core/utils/color_utils.dart';

Color primaryColor = ColorUtils.fromHex('#418B87');
const Color primaryColorDark = Color(0xff2e82e8);
const Color accentColor = Color(0xffab9d72);
// const Color backgroundColor = Color(0xFFF1F3F5);
const Color iconColor = Colors.white;
const Color whiteColor = Colors.white;
const Color lightGreyColor = Colors.white60;

const Color textColor = Color(0xFF1C1C1C);
const Color textColorLight = Color(0xFF93959A);

const Color bgLightGreen = Color.fromRGBO(0, 194, 144, 1);

enum ColorSeed {
  baseColor('M3 Baseline', Color(0xff6750a4)),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  teal('Teal', Colors.teal),
  green('Green', Color(0xff029642)),
  yellow('Yellow', Colors.yellow),
  orange('Orange', Colors.orange),
  deepOrange('Deep Orange', Colors.deepOrange),
  pink('Pink', Colors.pink);

  const ColorSeed(this.label, this.color);
  final String label;
  final Color color;
}

const backgroundColor = Color.fromARGB(255, 100, 93, 197);
const activeColor = Color.fromARGB(255, 31, 212, 107);
const white = Colors.white;
const red = Colors.red;
const black = Colors.black;
const dividerColor = Color.fromARGB(255, 207, 207, 207);
