import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBarTheme: theme.appBarTheme.copyWith(
          // backgroundColor: theme.colorScheme.surface.withOpacity(0.1),
          elevation: 1,
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light),
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.colorScheme.surface,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        showUnselectedLabels: true,
        elevation: 0,
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
