import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(48, 57, 79, 1);
  static const Color secondary = Color.fromRGBO(255, 200, 57, 1);
  static const Color background = Color.fromRGBO(45, 45, 45, 1);
  static const Color stroke = Color.fromRGBO(172, 178, 255, 1);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    colorScheme:
        const ColorScheme.light(primary: primary, secondary: secondary),
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: secondary,
          textStyle: const TextStyle(fontSize: 18)),
    ),
  );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: secondary,
    colorScheme:
        const ColorScheme.light(primary: secondary, secondary: primary),
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: primary, textStyle: const TextStyle(fontSize: 18)),
    ),
  );
}
