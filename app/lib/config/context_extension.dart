import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension  ContextExtension on BuildContext {
  double get fullHeight => MediaQuery.of(this).size.height;
  double get fullWidth => MediaQuery.of(this).size.width;

  double heightP(double perc) => fullHeight * perc / 100;
  double widthP(double perc) => fullWidth * perc / 100;

  bool get isMobile => fullWidth < 600;
  bool get isTabletMine => 600 <= fullWidth && fullWidth <= 900;
  bool get isDesktop => fullWidth >= 900;

  double horPad(double value) => widthP(0.1) * value;
  double get navbarHeight => heightP(5);
  double pageHeight({double perc = 100}) => heightP(95) * perc / 100;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}