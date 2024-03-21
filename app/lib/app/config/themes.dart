import 'package:flutter/material.dart';

class Themes {
  static ThemeData darkTheme() {
    ThemeData theme = ThemeData.dark(
      useMaterial3: true,
    );
    theme = theme.copyWith(
      scrollbarTheme: theme.scrollbarTheme.copyWith(
        thumbColor: MaterialStateProperty.all(theme.colorScheme.secondary),
        trackColor: MaterialStateProperty.all(theme.colorScheme.surface),
        thickness: MaterialStateProperty.all(5),
        thumbVisibility: MaterialStateProperty.all(true),
        trackVisibility: MaterialStateProperty.all(true),
        trackBorderColor:
            MaterialStateProperty.all(theme.colorScheme.secondary),
        interactive: true,
        crossAxisMargin: 2,
      ),
    );
    return theme;
  }

  static ThemeData lightTheme() {
    ThemeData theme = ThemeData.light(
      useMaterial3: true,
    );
    return theme;
  }
}
