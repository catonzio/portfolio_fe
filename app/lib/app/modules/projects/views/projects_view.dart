import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/app//shared/ui/mypage.dart';
import 'package:portfolio/app/modules/projects/views/project_mobile_view.dart';
import 'package:portfolio/app/modules/projects/views/projects_desktop_view.dart';
import 'package:portfolio/app/shared/ui/responsive.dart';

import '../controllers/projects_controller.dart';

class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    final ProjectsController controller = ProjectsController.to;
    return MyPage(
        body: const Responsive(
          mobile: ProjectsMobileView(),
          desktop: ProjectsDesktopView(),
        ),
        isScrollEnabled: (Offset offset) => controller.isScrollEnabled(offset));
  }
}
