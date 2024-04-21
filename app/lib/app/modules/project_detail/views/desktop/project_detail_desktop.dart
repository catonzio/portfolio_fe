import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/project_detail/controllers/project_detail_controller.dart';

class ProjectDetailDesktop extends StatelessWidget {
  const ProjectDetailDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final ProjectDetailController controller = ProjectDetailController.to;
    return Center(
      child: Text(controller.project.name ?? ""),
    );
  }
}
