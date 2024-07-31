import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/controllers/projects_controller.dart';
import 'package:portfolio/app/modules/projects/views/mobile/widgets/project_box_mobile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjectsColumn extends GetView<ProjectsController> {
  const ProjectsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.5,
      child: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: Obx(() => Skeletonizer(
              enabled: controller.isFetchingProjects.value,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: (controller.isFetchingProjects.value
                        ? controller.fakeProjects
                        : controller.projects)
                    .indexed
                    .map((e) => ProjectBoxMobile(index: e.$1, project: e.$2))
                    .toList()
                    .animate(delay: 500.ms, interval: 500.ms)
                    .fade()
                    .moveX(begin: -200, end: 0),
              ),
            )),
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
