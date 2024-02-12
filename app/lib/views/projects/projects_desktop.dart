import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/data/controllers/home_controller.dart';
import 'package:portfolio/data/models/section.dart';
import 'package:portfolio/widgets/custom_grid.dart';
import 'package:portfolio/widgets/section_title.dart';

class ProjectsDesktop extends StatelessWidget {
  final Section section;
  const ProjectsDesktop(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return Container(
          padding: const EdgeInsets.all(32),
          color: section.bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SectionTitle(
                title: "Projects",
                baseStyle: context.textTheme.displayLarge!,
              ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
              getBody(context)
            ],
          ).animate(target: controller.currentSection == section.title ? 1 : 0)
          // .fadeIn(delay: 100.ms, begin: controller.currentSectionScrollPerc),
          );
    });
  }

  Container getBody(BuildContext context) {
    Size size = Size(context.widthP(90), context.pageHeight(perc: 70));
    return Container(
        alignment: Alignment.center,
        width: size.width,
        height: size.height,
        child: Configs.projectsDetails.isEmpty
            ? Text(
                "No project available",
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: context.colorScheme.onInverseSurface),
              )
            : CustomGrid.fromList(
                elements: Configs.projectsDetails.values.toList(),
                nCols: 3,
                gridSize: size));
  }
}
