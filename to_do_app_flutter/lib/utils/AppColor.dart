import 'package:flutter/material.dart';

class AppColors {
  static const int greyPlatinum = 0xffe5e4e2; //titanium grey
  static const int white = 0xffffffff; //white
  static const Color colorAccent = Colors.pinkAccent; //white

  static const Map<int, Color> greyPlatinumMap = {
    50: Color.fromRGBO(229, 228, 226, .1),
    100: Color.fromRGBO(229, 228, 226, .2),
    200: Color.fromRGBO(229, 228, 226, .3),
    300: Color.fromRGBO(229, 228, 226, .4),
    400: Color.fromRGBO(229, 228, 226, .5),
    500: Color.fromRGBO(229, 228, 226, .6),
    600: Color.fromRGBO(229, 228, 226, .7),
    700: Color.fromRGBO(229, 228, 226, .8),
    800: Color.fromRGBO(229, 228, 226, .9),
    900: Color.fromRGBO(229, 228, 226, 1),
  };

  static const Map<int, Color> whiteMap = {
    50: Color.fromRGBO(255, 255, 255, .1),
    100: Color.fromRGBO(255, 255, 255, .2),
    200: Color.fromRGBO(255, 255, 255, .3),
    300: Color.fromRGBO(255, 255, 255, .4),
    400: Color.fromRGBO(255, 255, 255, .5),
    500: Color.fromRGBO(255, 255, 255, .6),
    600: Color.fromRGBO(255, 255, 255, .7),
    700: Color.fromRGBO(255, 255, 255, .8),
    800: Color.fromRGBO(255, 255, 255, .9),
    900: Color.fromRGBO(255, 255, 255, 1),
  };

  static Color getBackgroundColor(int index) {
    Color color = Colors.white;
    switch (index) {
      case 0:
        color = Colors.white;
        break;
      case 1:
        color = Colors.grey;
        break;
      case 2:
        color = Colors.blue;
        break;
      case 3:
        color = Colors.lime;
        break;
      case 4:
        color = Colors.amber;
        break;
      case 5:
        color = Colors.deepOrangeAccent;
        break;
      case 6:
        color = Colors.deepPurple;
        break;
    }
    return color;
  }
}
