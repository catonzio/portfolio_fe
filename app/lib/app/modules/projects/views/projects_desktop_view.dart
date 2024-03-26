import 'dart:math';
import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/controllers/projects_controller.dart';
import 'package:portfolio/app/modules/projects/project_model.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/text_styles.dart';

final globalEffetcs = <Element>[FadeEffect()];

class ProjectsDesktopView extends StatelessWidget {
  const ProjectsDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.surfaceVariant,
      alignment: Alignment.center,
      child: SizedBox(
        width: min(context.width, 1250),
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Projects", style: TextStyles.negativeSectionTitle)
                  .animate()
                  .fade(delay: 500.ms, duration: 1000.ms)
                  .flipV(duration: 250.ms)
                  .moveY(
                      delay: 500.ms,
                      begin: -context.height * 0.05,
                      end: 0,
                      duration: 250.ms)
                  .shimmer(
                      delay: 1000.ms,
                      color: AppColors.lightGrey,
                      duration: 2000.ms),
              DefaultTextStyle(
                style: context.theme.textTheme.titleLarge!.copyWith(
                    color: context.theme.colorScheme.onSurfaceVariant),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: Constants.projectsDescription
                        .split("\n")
                        .map((String text) => Text(text.trim()))
                        .toList()),
              ),
              const ProjectsRow()
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectsRow extends StatelessWidget {
  const ProjectsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.4,
      child: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: Constants.projects
              .map((e) => ProjectBox(project: e))
              .toList()
              .animate(delay: 500.ms, interval: 500.ms)
              .fade()
              .moveX(begin: -200, end: 0),
        ),
      ),
    );
  }
}

class ProjectBox extends StatelessWidget {
  final Project project;
  const ProjectBox({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final ProjectsController controller = ProjectsController.to;
    return InkWell(
      onTap: () => controller.onTap(project.id!),
      onHover: (value) => controller.onHover(project.id!, value),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(16),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: context.theme.colorScheme.surface,
                  blurRadius: 5,
                  // offset: Offset(0, 2),
                ),
              ],
            ),
            // shadowColor: context.theme.colorScheme.surfaceVariant,
            // elevation: 20,

            child: Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpandablePanel(
                    controller: controller.expandableControllers[project.id!],
                    collapsed: SizedBox(
                        width: context.width * 0.09,
                        child: Text("Title: ${project.name}")),
                    expanded: SizedBox(
                      width: context.width * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Title: ${project.name}"),
                          Text("Project Description: ${project.description}"),
                        ],
                      ),
                    ),
                  ),
                ))),
      ),
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad
      };
}
