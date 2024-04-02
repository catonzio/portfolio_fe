import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/controllers/projects_controller.dart';
import 'package:portfolio/app/modules/projects/project_model.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/themes.dart';

class ProjectBoxMobile extends StatelessWidget {
  final Project project;
  const ProjectBoxMobile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final ProjectsController controller = ProjectsController.to;
    final double expandedHeight = context.height * 0.22;
    final double collapsedHeight = context.height * 0.05;

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
                collapsed: CollapsedProjectBoxMobile(
                    collapsedHeight: collapsedHeight, project: project),
                expanded: ExpandedProjectBoxMobile(
                    expandedHeight: expandedHeight, project: project),
              );
            })),
      ),
    );
  }
}

class CollapsedProjectBoxMobile extends StatelessWidget {
  final double collapsedHeight;
  final Project project;

  const CollapsedProjectBoxMobile({
    super.key,
    required this.collapsedHeight,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: collapsedHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: AssetImage(project.imagePath!),
            fit: BoxFit.cover,
            opacity: 0.3),
      ),
      alignment: AlignmentDirectional.bottomEnd,
      child: Text(
        project.name!.toUpperCase(),
        style: context.theme.textTheme.headlineLarge!.copyWith(
            color: context.theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ExpandedProjectBoxMobile extends StatelessWidget {
  final double expandedHeight;
  final Project project;

  const ExpandedProjectBoxMobile({
    super.key,
    required this.expandedHeight,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: expandedHeight,
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
