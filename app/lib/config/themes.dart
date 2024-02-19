import 'package:flutter/material.dart';

class Themes {
  static Color get black => const Color(0xFF000000);
  static Color get lightGrey => const Color.fromARGB(255, 232, 232, 232);
  static Color get darkGrey => const Color.fromARGB(255, 52, 50, 50);
  static Color get electricBlue => const Color.fromARGB(255, 0, 122, 255);
  static Color get coolGreen => const Color.fromARGB(255, 52, 199, 89);

  static ThemeData lightTheme() {
    var base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      textTheme: base.textTheme.apply(fontFamily: 'Inter'),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(),
      // colorScheme: base.colorScheme.copyWith(
      //     primary: Colors.black,
      //     secondary: Colors.black,
      //     onPrimary: Colors.white,
      //     onSecondary: Colors.white,
      //     surface: Colors.purple)
    );
  }

  static ThemeData darkTheme() {
    var base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
        textTheme: base.textTheme.apply(fontFamily: 'Inter'),
        appBarTheme: AppBarTheme(
            surfaceTintColor: black.withOpacity(0.90),
            color: black.withOpacity(0.90),
            elevation: 10,
            centerTitle: true),
        colorScheme: base.colorScheme.copyWith(
            background: Colors.black,
            inverseSurface: Colors.white,
            inversePrimary: darkGrey)
        // floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        //   backgroundColor: Colors.white,
        // ),
        // colorScheme: base.colorScheme.copyWith(
        //     primary: Colors.white,
        //     secondary: Colors.white,
        //     onPrimary: Colors.black,
        //     onSecondary: Colors.black,
        //     surface: Colors.red)
        );
  }

  // static ColorScheme colorScheme(BuildContext context) =>
  //     Theme.of(context).colorScheme;

  // static TextTheme textTheme(BuildContext context) =>
  //     Theme.of(context).textTheme;
}
