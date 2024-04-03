import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/views/desktop/widgets/projects_box_desktop.dart';
import 'package:portfolio/app/modules/projects/views/mobile/widgets/projects_column.dart';
import 'package:portfolio/config/constants.dart';

class ProjectsRow extends StatelessWidget {
  const ProjectsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = context.height * 0.4;
    return SizedBox(
      height: height,
      child: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: Constants.projects
              .map((e) => ProjectBox(project: e, height: height,))
              .toList()
              .animate(delay: 500.ms, interval: 500.ms)
              .fade()
              .moveX(begin: -200, end: 0),
        ),
      ),
    );
  }
}
