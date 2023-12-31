import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/data/controllers/home_controller.dart';
import 'package:portfolio/data/models/section.dart';
import 'package:portfolio/widgets/custom_grid.dart';

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
              getTitle(context)
                  .animate()
                  .fadeIn(delay: 500.ms, duration: 500.ms),
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
                elements: Configs.projectsDetails.values.toList(), nCols: 3, gridSize: size)
        //  GridView.builder(
        //     shrinkWrap: true,
        //     itemCount: Configs.projectsDetails.length,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         childAspectRatio:
        //             context.fullWidth / context.fullHeight / 1.3,
        //         crossAxisCount: math.min(3, Configs.projectsDetails.length),
        //         crossAxisSpacing: 16,
        //         mainAxisSpacing: 16),
        //     itemBuilder: (context, index) {
        //       Get.put(ProjectsController(), tag: index.toString());
        //       return ProjectCard(
        //         index: index,
        //       );
        //     }),
        );
  }

  Widget getTitle(BuildContext context) {
    return Column(
      children: [
        Text(
          "Projects",
          style: Themes.textTheme(context).displayLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Themes.colorScheme(context).onInverseSurface),
        ),
        SizedBox(
          width: context.widthP(10),
          child: Divider(
            thickness: 10,
            color: Themes.colorScheme(context).inversePrimary,
          ),
        )
      ],
    );
  }
}
