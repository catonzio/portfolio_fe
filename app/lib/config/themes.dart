import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/colors.dart';

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
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          color: Colors.transparent,
          elevation: 1,
          scrolledUnderElevation: 0),
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
    theme = theme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(theme.textTheme),
        colorScheme: theme.colorScheme.copyWith(
          primaryContainer: AppColors.darkGrey,
          secondaryContainer: AppColors.darkWhite,
          surface: AppColors.whiteBackground,
          onSurface: AppColors.onWhiteBackground,
          surfaceVariant: AppColors.darkBackground,
          onSurfaceVariant: AppColors.onDarkBackground,
        ),
        bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
          type: BottomNavigationBarType.fixed,
          backgroundColor: theme.colorScheme.surface,
          selectedItemColor: Colors.grey,
          unselectedItemColor: AppColors.onWhiteBackground,
          showUnselectedLabels: true,
          elevation: 0,
        ),
        scrollbarTheme: theme.scrollbarTheme.copyWith(
          thumbVisibility: MaterialStateProperty.all(true),
          trackVisibility: MaterialStateProperty.all(true),
          thumbColor: MaterialStateProperty.all(AppColors.darkGrey),
        ));
    return theme;
  }
}
