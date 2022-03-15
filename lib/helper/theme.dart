import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
        color: Colors.white, iconTheme: IconThemeData(color: Colors.black)),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.black,
      primaryVariant: Colors.white38,
      secondary: Colors.red,
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline2: TextStyle(
            fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline3: TextStyle(
            fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline4: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w800, color: Colors.black),
        subtitle1: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w800, color: Colors.black),
        bodyText1: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.w800, color: Colors.black),
        bodyText2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.black)),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
        color: Colors.black, iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.white,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
        headline2: TextStyle(
            fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
        headline3: TextStyle(
            fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        headline4: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w800, color: Colors.white),
        subtitle1: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w800, color: Colors.white),
        bodyText1: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.white),
        bodyText2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.white)),
  );
}
