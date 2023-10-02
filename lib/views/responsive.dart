import 'package:flutter/material.dart';
import 'package:portfolio/config/dimensions.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Dimensions.isDesktop(context)) {
          return desktop;
        } else if (Dimensions.isTablet(context)) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
