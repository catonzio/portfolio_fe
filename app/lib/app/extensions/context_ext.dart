import 'package:flutter/material.dart';
import 'package:portfolio/config/constants.dart';

extension ResponsiveContext on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  TextScaler get textScaleFactor => MediaQuery.of(this).textScaler;
  bool get isMobile => width < Constants.mobileWidth;
  bool get isTablet =>
      Constants.mobileWidth <= width && width < Constants.desktopWidth;
  bool get isDesktop => width >= Constants.desktopWidth;
  // bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  // bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
}
