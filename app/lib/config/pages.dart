import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/mytransition.dart';
import 'package:portfolio/config/routes.dart';
import 'package:portfolio/ui/trial_page.dart';

class Pages {
  static Map<String, GetPage> pages = {
    Routes.trial: GetPage(
      name: Routes.trial,
      page: () => const TrialPage(),
      customTransition: MyTransition(index: 0),
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeInQuart,
    ),
    Routes.trial2: GetPage(
      name: Routes.trial2,
      page: () => const TrialPage2(),
      customTransition: MyTransition(index: 1),
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeInQuart,
    ),
  };
}
