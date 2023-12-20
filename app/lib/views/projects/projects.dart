import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';
import 'package:portfolio/views/projects/projects_desktop.dart';
import 'package:portfolio/views/projects/projects_mobile.dart';
import 'package:portfolio/views/projects/projects_tablet.dart';
import 'package:portfolio/views/responsive.dart';

class ProjectsPage extends StatelessWidget {
  final Section section;
  const ProjectsPage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {

    return Responsive(
      mobile: ProjectsMobile(section),
      desktop: ProjectsDesktop(section),
      tablet: ProjectsTablet(section),
    );
  }
}
