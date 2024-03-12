import 'package:flutter/material.dart';

class Themes {
  
  static ThemeData lightTheme() {
    ThemeData theme = ThemeData.light(
      useMaterial3: true,
    );
    return theme;
  }

  static ThemeData darkTheme() {
    ThemeData theme = ThemeData.dark(
      useMaterial3: true,
    );
    return theme;
  }
}
