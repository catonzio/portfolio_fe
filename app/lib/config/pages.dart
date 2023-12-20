import 'package:get/get.dart';
import 'package:portfolio/data/bindings/main_binding.dart';
import 'package:portfolio/data/bindings/project_detail_binding.dart';
import 'package:portfolio/views/main_view.dart';
import 'package:portfolio/views/project_detail/project_detail.dart';

import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.main,
        page: () => const MainView(),
        binding: MainBindings()),
    GetPage(
        name: Routes.projectDetail,
        arguments: const {'projectName': ''},
        transition: Transition.downToUp,
        page: () => const ProjectDetailPage(),
        binding: ProjectDetailBindings()),
  ];
}
