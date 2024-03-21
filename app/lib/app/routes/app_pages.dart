import 'package:app/app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/projects/bindings/projects_binding.dart';
import '../modules/projects/views/projects_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
    ),
    GetPage(
      name: _Paths.about,
      page: () => const AboutView(),
      binding: AboutBinding(),
      transition: Transition.cupertino,
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
    ),
    GetPage(
      name: _Paths.projects,
      page: () => const ProjectsView(),
      binding: ProjectsBinding(),
      transition: Transition.cupertino,
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
    ),
    GetPage(
      name: _Paths.contact,
      page: () => const ContactView(),
      binding: ContactBinding(),
      transition: Transition.cupertino,
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
    ),
  ];
}
