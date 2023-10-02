
import 'package:flutter/material.dart';
import 'package:portfolio/views/project_detail/project_detail_desktop.dart';
import 'package:portfolio/views/project_detail/project_detail_mobile.dart';
import 'package:portfolio/views/project_detail/project_detail_tablet.dart';
import 'package:portfolio/views/responsive.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: const ProjectDetailMobile(),
      desktop: ProjectDetailDesktop(),
      tablet: const ProjectDetailTablet(),
    );
  }
}

