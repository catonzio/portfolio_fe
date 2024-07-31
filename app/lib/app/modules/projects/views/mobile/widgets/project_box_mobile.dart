import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/controllers/projects_controller.dart';
import 'package:portfolio/app/modules/projects/project_model.dart';
import 'package:portfolio/app/modules/projects/views/widgets/project_box.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/themes.dart';

class ProjectBoxMobile extends StatelessWidget {
  final int index;
  final Project project;

  const ProjectBoxMobile(
      {super.key, required this.index, required this.project});

  @override
  Widget build(BuildContext context) {
    final ProjectsController controller = ProjectsController.to;
    final double expandedHeight = (context.height * 0.3).clamp(100, 300);
    final double collapsedHeight = context.height * 0.07;

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
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Obx(() {
              return ExpandablePanel(
                theme: Themes.expandableTheme,
                controller: controller.expandableControllers[index],
                collapsed: CollapsedProjectBox(
                  collapsedHeight: collapsedHeight,
                  isDesktop: false,
                  project: project,
                ),
                expanded: ExpandedProjectBox(
                    expandedHeight: expandedHeight,
                    isDesktop: false,
                    project: project),
              );
            })),
      ),
    );
  }
}
