import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF2d3e50);
  static const primaryLightColor = Color(0xFF58687c);
  static const secondaryColor = Color(0xFF2d3e50);
  static const secondaryLightColor = Color(0x0fffffff);
  static const primaryTextColor = Color(0xFFffffff);
  static const secondaryTextColor = Color(0xFF000000);

  static const primaryDarkColor = Color(0xFF041828);
  static const secondaryDarkColor = Color(0xFFcccccc);

  static const backGroundColor = Color(0xFFFAFAFA);
  static const primarySwatch = Color(0xFFFAFAFA);
  static const lightOrange = Color.fromARGB(255, 252, 174, 79);
  static MaterialColor primaryMaterialColor = MaterialColor(0xFF2d3e50, primaryMapColor);

  static Map<int, Color> primaryMapColor = {
    50: const Color.fromRGBO(45, 62, 80, .1),
    100: const Color.fromRGBO(45, 62, 80, .2),
    200: const Color.fromRGBO(45, 62, 80, .3),
    300: const Color.fromRGBO(45, 62, 80, .4),
    400: const Color.fromRGBO(45, 62, 80, .5),
    500: const Color.fromRGBO(45, 62, 80, .6),
    600: const Color.fromRGBO(45, 62, 80, .7),
    700: const Color.fromRGBO(45, 62, 80, .8),
    800: const Color.fromRGBO(45, 62, 80, .9),
    900: const Color.fromRGBO(45, 62, 80, 1),
  };
}
