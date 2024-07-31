import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/controllers/projects_controller.dart';
import 'package:portfolio/app/modules/projects/project_model.dart';
import 'package:portfolio/app/modules/projects/views/widgets/project_box.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/themes.dart';

class ProjectBox extends StatelessWidget {
  final int index;
  final Project project;
  final double height;
  const ProjectBox({super.key, required this.index, required this.project, required this.height});

  @override
  Widget build(BuildContext context) {
    final ProjectsController controller = ProjectsController.to;
    var collapsedWidth = context.width * 0.1;
    final double expandedWidth = (context.width * 0.4).clamp(100, 500);

    return InkWell(
      onTap: () => controller.onTap(index),
      onHover: (value) => controller.onHover(index, value),
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
                controller: controller.expandableControllers[index],
                collapsed: CollapsedProjectBox(
                    collapsedWidth: collapsedWidth,
                    isDesktop: true,
                    project: project),
                expanded: ExpandedProjectBox(
                    expandedWidth: expandedWidth,
                    expandedHeight: height,
                    isDesktop: true,
                    project: project),
              );
            })),
      ),
    );
  }
}
