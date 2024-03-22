import 'package:flutter/material.dart';
import 'package:portfolio/config/constants.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive(
      {super.key, required this.mobile, this.tablet, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < Constants.mobileWidth) {
        return mobile;
      } else if (Constants.mobileWidth <= constraints.maxWidth &&
          constraints.maxWidth < Constants.desktopWidth) {
        return tablet ?? desktop;
      } else {
        return desktop;
      }
    });
  }
}
