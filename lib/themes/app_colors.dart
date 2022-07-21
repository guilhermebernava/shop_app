import 'package:flutter/material.dart';

class AppColors {
  static const purple = Color(0xffDC9CFD);
  static const lightRose = Color(0xffFEEFEC);
  static const green = Color.fromARGB(255, 126, 228, 74);
  static const darkGreen = Color.fromARGB(255, 67, 175, 13);
  static const white = Color(0xffFFFFFF);
  static const orange = Color(0xffF56A4C);
}

class AppThemeColor {
  static const color = 0xffF56A4C;

  static const Map<int, Color> colors = {
    50: Color.fromRGBO(255, 245, 106, 0.098),
    100: Color.fromRGBO(255, 245, 106, .2),
    200: Color.fromRGBO(255, 245, 106, .3),
    300: Color.fromRGBO(255, 245, 106, .4),
    400: Color.fromRGBO(255, 245, 106, .5),
    500: Color.fromRGBO(255, 245, 106, .6),
    600: Color.fromRGBO(255, 245, 106, .7),
    700: Color.fromRGBO(255, 245, 106, .8),
    800: Color.fromRGBO(255, 245, 106, .9),
    900: Color.fromRGBO(255, 245, 106, 1),
  };

  static const colorSecondary = 0xffDC9CFD;

  static const Map<int, Color> colorsSecondary = {
    50: Color.fromRGBO(255, 220, 156, 0.098),
    100: Color.fromRGBO(255, 220, 156, .2),
    200: Color.fromRGBO(255, 220, 156, .3),
    300: Color.fromRGBO(255, 220, 156, .4),
    400: Color.fromRGBO(255, 220, 156, .5),
    500: Color.fromRGBO(255, 220, 156, .6),
    600: Color.fromRGBO(255, 220, 156, .7),
    700: Color.fromRGBO(255, 220, 156, .8),
    800: Color.fromRGBO(255, 220, 156, .9),
    900: Color.fromRGBO(255, 220, 156, 1),
  };

  static const secondaryColor = MaterialColor(
    AppThemeColor.colorSecondary,
    AppThemeColor.colorsSecondary,
  );
}
