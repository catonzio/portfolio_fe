import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/controllers/projects_controller.dart';
import 'package:portfolio/app/modules/projects/project_model.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/themes.dart';

class ProjectBox extends StatelessWidget {
  final Project project;
  const ProjectBox({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final ProjectsController controller = ProjectsController.to;
    var collapsedWidth = context.width * 0.07;
    var expandedWidth = context.width * 0.2;

    return InkWell(
      onTap: () => controller.onTap(project.id!),
      onHover: (value) => controller.onHover(project.id!, value),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.darkGrey,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: context.theme.colorScheme.surface.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Obx(() {
              return ExpandablePanel(
                theme: Themes.expandableTheme,
                controller: controller.expandableControllers[project.id!],
                collapsed: CollapsedProjectBoxDesktop(
                    collapsedWidth: collapsedWidth, project: project),
                expanded: ExpandedProjectBoxDesktop(
                    expandedWidth: expandedWidth, project: project),
              );
            })),
      ),
    );
  }
}

class CollapsedProjectBoxDesktop extends StatelessWidget {
  const CollapsedProjectBoxDesktop({
    super.key,
    required this.collapsedWidth,
    required this.project,
  });

  final double collapsedWidth;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: collapsedWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: AssetImage(project.imagePath!),
            fit: BoxFit.cover,
            opacity: 0.3),
      ),
      alignment: AlignmentDirectional.bottomEnd,
      child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            project.name!.toUpperCase(),
            style: context.theme.textTheme.headlineLarge!.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}

class ExpandedProjectBoxDesktop extends StatelessWidget {
  const ExpandedProjectBoxDesktop({
    super.key,
    required this.expandedWidth,
    required this.project,
  });

  final double expandedWidth;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: expandedWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: AssetImage(project.imagePath!),
            fit: BoxFit.cover,
            opacity: 0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Title: ${project.name}"),
          Text("Project Description: ${project.description}"),
        ],
      ),
    );
  }
}
