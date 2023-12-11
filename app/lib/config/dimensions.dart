import 'package:flutter/material.dart';

class Dimensions {
  static height(BuildContext context, {double? perc}) =>
      MediaQuery.of(context).size.height * ((perc ?? 100) / 100);
  static width(BuildContext context, {double? perc}) =>
      MediaQuery.of(context).size.width * ((perc ?? 100) / 100);

  static bool isMobile(BuildContext context) => width(context) < 600;
  static bool isTablet(BuildContext context) =>
      600 <= width(context) && width(context) <= 900;
  static bool isDesktop(BuildContext context) => width(context) >= 900;

  static double horPad(BuildContext context, double value) =>
      width(context, perc: 0.1) * value;

  static double navbarHeight(context) => Dimensions.height(context, perc: 5);
  static double pageHeight(context, {double? perc}) =>
      Dimensions.height(context, perc: 95) * ((perc ?? 100) / 100);
}
