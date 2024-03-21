// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';
// import 'package:portfolio/config/mytransition.dart';
import 'package:portfolio/config/routes.dart';
import 'package:portfolio/data/bindings/trial2_binding.dart';
import 'package:portfolio/ui/trial_page.dart';

class Pages {
  static Map<String, GetPage> pages = {
    Routes.trial2: GetPage(
        name: Routes.trial2,
        page: () => const TrialPage2(),
        transition: Transition.circularReveal,
        // customTransition: MyTransition(index: 0),
        transitionDuration: Constants.pageTransitionDuration,
        curve: Curves.easeInCirc,
        // curve: const SineCurve(),
        binding: Trial2Binding(),
        maintainState: true),
    Routes.trial: GetPage(
      name: Routes.trial,
      page: () => const TrialPage(),
      transition: Transition.size,
      // customTransition: MyTransition(index: 1),
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
      // curve: const SineCurve(),
    ),
    Routes.trial3: GetPage(
      name: Routes.trial3,
      page: () => const TrialPage3(),
      transition: Transition.size,
      // customTransition: MyTransition(index: 2),
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
      // curve: const SineCurve(),
    ),
  };
}
