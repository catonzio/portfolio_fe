import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/controllers/projects_controller.dart';
import 'package:portfolio/app/modules/projects/views/desktop/widgets/projects_box_desktop.dart';
import 'package:portfolio/app/modules/projects/views/mobile/widgets/projects_column.dart';
import 'package:portfolio/config/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjectsRow extends GetView<ProjectsController> {
  const ProjectsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = context.height * 0.4;
    return SizedBox(
      height: height,
      child: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: Obx(() {
          print(controller.projects.isEmpty);
          return Skeletonizer(
            enabled: controller.isFetchingProjects.value,
            child: controller.projects.isEmpty
                ? Text(
                    "There are no projects",
                    style: context.textTheme.headlineLarge
                        ?.copyWith(color: AppColors.onDarkBackground),
                  )
                : ListView(
                    scrollDirection: Axis.horizontal,
                    children: (controller.isFetchingProjects.value
                            ? controller.fakeProjects
                            : controller.projects)
                        .indexed
                        .map((e) => ProjectBox(
                              index: e.$1,
                              project: e.$2,
                              height: height,
                            ))
                        .toList()
                        .animate(delay: 500.ms, interval: 500.ms)
                        .fade()
                        .moveX(begin: -200, end: 0),
                  ),
          );
        }),
      ),
    );
  }
}
