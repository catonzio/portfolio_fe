import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/controllers/section_controller.dart';
import 'package:portfolio/views/projects/projects_desktop.dart';
import 'package:portfolio/views/projects/projects_mobile.dart';
import 'package:portfolio/views/projects/projects_tablet.dart';
import 'package:portfolio/views/responsive.dart';

class ProjectsPage extends StatelessWidget {
  final String title;
  const ProjectsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SectionController controller = Get.find<SectionController>(tag: title);

    return Responsive(
      mobile: ProjectsMobile(controller),
      desktop: ProjectsDesktop(controller),
      tablet: ProjectsTablet(controller),
    );
  }
}
