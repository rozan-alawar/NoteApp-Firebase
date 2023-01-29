import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color.fromARGB(255, 26, 27, 26);
  static Color lightPrimary =
      const Color.fromARGB(255, 34, 174, 163); // color with 80% opacity
  static const Color darkGrey = Color(0xff545454);
  static const Color grey = Color(0xff828282);
  static const Color lightGrey = Color.fromARGB(255, 217, 217, 224);
  static const Color black = Color(0xff141010);
  static const Color lightBlack = Color(0xff414138);
  static const Color white = Color(0xffFFFFFF);
  static const Color whiteSmoke = Color(0xffF7F7F7);
  static const Color transarent = Colors.transparent;

  static List<Color> cardsColor = [
    ColorManager.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.teal.shade100,
    Colors.yellow.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
    Colors.purple.shade100,
  ];
}
