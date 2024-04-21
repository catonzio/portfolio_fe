import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config/constants.dart';
import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/project_detail/bindings/project_detail_binding.dart';
import '../modules/project_detail/views/project_detail_view.dart';
import '../modules/projects/bindings/projects_binding.dart';
import '../modules/projects/views/projects_view.dart';
import '../modules/unknown/views/unknown_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static GetPage unknownRoute = GetPage(
    name: _Paths.unknown,
    page: () => const UnknownView(),
    transition: Transition.size,
    transitionDuration: Constants.pageTransitionDuration,
    curve: Curves.easeInCirc,
  );

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.size,
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
    ),
    GetPage(
      name: _Paths.about,
      page: () => const AboutView(),
      binding: AboutBinding(),
      transition: Transition.size,
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
    ),
    GetPage(
      name: _Paths.projects,
      page: () => const ProjectsView(),
      binding: ProjectsBinding(),
      transition: Transition.size,
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
    ),
    GetPage(
      name: _Paths.contact,
      page: () => const ContactView(),
      binding: ContactBinding(),
      transition: Transition.size,
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
    ),
    GetPage(
      name: _Paths.projectDetail,
      page: () => const ProjectDetailView(),
      binding: ProjectDetailBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Constants.pageTransitionDuration,
      curve: Curves.easeInCirc,
    ),
  ];
}
