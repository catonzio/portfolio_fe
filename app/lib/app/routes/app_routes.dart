part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();

  static int numRoutes = Routes.all.length;

  static const home = _Paths.home;
  static const about = _Paths.about;
  static const projects = _Paths.projects;
  static const contact = _Paths.contact;

  static const all = [
    home,
    about,
    projects,
    contact,
  ];
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const about = '/about';
  static const projects = '/projects';
  static const contact = '/contact';
}
