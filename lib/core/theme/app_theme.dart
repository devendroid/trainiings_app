import 'package:flutter/material.dart';

abstract class AppTheme {

  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFFF004E),
    primarySwatch: Colors.pink,
    appBarTheme: const AppBarTheme(elevation: 0, centerTitle: false),
  );
}

extension CustomTheme on ThemeData {
  Color get primaryTextColor => Colors.black87;
  Color get secondaryTextColor => Colors.black45;
}