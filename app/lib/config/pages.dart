import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/mytransition.dart';
import 'package:portfolio/config/routes.dart';
import 'package:portfolio/data/bindings/trial2_binding.dart';
import 'package:portfolio/ui/trial_page.dart';

class SineCurve extends Curve {
  final double count;

  const SineCurve({this.count = 3});

  // t = x
  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    return val; //f(x)
  }
}

class Pages {
  static Map<String, GetPage> pages = {
    Routes.trial2: GetPage(
        name: Routes.trial2,
        page: () => const TrialPage2(),
        // customTransition: MyTransition(index: 0),
        transitionDuration: Constants.pageTransitionDuration,
        curve: Curves.easeInCirc,
        // curve: const SineCurve(),
        binding: Trial2Binding(),
        maintainState: true),
    Routes.trial: GetPage(
      name: Routes.trial,
      page: () => const TrialPage(),
      // customTransition: MyTransition(index: 1),
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
      // curve: const SineCurve(),
    ),
    Routes.trial3: GetPage(
      name: Routes.trial3,
      page: () => const TrialPage3(),
      // customTransition: MyTransition(index: 2),
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
      // curve: const SineCurve(),
    ),
  };
}
