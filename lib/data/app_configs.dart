import 'package:flutter/material.dart';

class AppColors {
  static const bluePrimary = Color(0xFF2d3e50);
    static MaterialColor primaryMaterialColor = MaterialColor(0xFF2d3e50, bluePrimaryMap);

  static Map<int, Color> bluePrimaryMap = {
    50: const Color.fromRGBO(45,62,80, .1),
    100: const Color.fromRGBO(45,62,80, .2),
    200: const Color.fromRGBO(45,62,80, .3),
    300: const Color.fromRGBO(45,62,80, .4),
    400: const Color.fromRGBO(45,62,80, .5),
    500: const Color.fromRGBO(45,62,80, .6),
    600: const Color.fromRGBO(45,62,80, .7),
    700: const Color.fromRGBO(45,62,80, .8),
    800: const Color.fromRGBO(45,62,80, .9),
    900: const Color.fromRGBO(45,62,80, 1),
  };

}
