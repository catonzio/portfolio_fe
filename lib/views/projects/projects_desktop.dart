import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/dimensions.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/controllers/home_controller.dart';
import 'package:portfolio/controllers/section_controller.dart';
import 'dart:math' as math;

import 'package:portfolio/models/project.dart';

class ProjectsDesktop extends StatelessWidget {
  final SectionController sectionController;
  const ProjectsDesktop(this.sectionController, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return Container(
          padding: const EdgeInsets.all(32),
          color: sectionController.bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Projects",
                    style: Themes.textTheme(context).displayLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Themes.colorScheme(context).onInverseSurface),
                  ),
                  SizedBox(
                    width: Dimensions.width(context, perc: 10),
                    child: Divider(
                      thickness: 10,
                      color: Themes.colorScheme(context).inversePrimary,
                    ),
                  )
                ],
              ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
              Container(
                // color: Colors.red,
                alignment: Alignment.center,
                // padding: const EdgeInsets.only(top: 64),
                width: Dimensions.width(context, perc: 70),
                height: Dimensions.pageHeight(context, perc: 80),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: Configs.projectsDetails.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: Dimensions.width(context) /
                            Dimensions.height(context) /
                            1.3,
                        crossAxisCount:
                            math.min(3, Configs.projectsDetails.length),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      Get.put(ProjectsController(), tag: index.toString());
                      return ProjectCard(
                        index: index,
                      );
                    }),
              )
            ],
          ).animate(
              target:
                  controller.currentSection == sectionController.title ? 1 : 0)
          // .fadeIn(delay: 100.ms, begin: controller.currentSectionScrollPerc),
          );
    });
  }
}

class ProjectsController extends GetxController {
  final RxBool _isHovering = false.obs;
  get isHovering => _isHovering.value;
  set isHovering(value) => _isHovering.value = value;
}

class ProjectCard extends StatelessWidget {
  final int index;

  const ProjectCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Project details = Configs.projectsDetails.values.toList()[index];
    return GetX<ProjectsController>(
      tag: index.toString(),
      builder: (controller) {
        return getBody(context, details, controller)
            .animate(
          target: controller.isHovering ? 1 : 0,
          onPlay: (controller) => controller.repeat(reverse: true),
        )
            .swap(builder: (context, child) {
          return controller.isHovering
              ? getBody(context, details, controller, borderWidth: 2)
              : child!;
        }).scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1));
      },
    ).animate().fadeIn(delay: (1000 + 200 * (index + 1)).ms, duration: 500.ms);
  }

  MouseRegion getBody(
      BuildContext context, Project details, ProjectsController controller,
      {Color? borderColor, double borderWidth = 5}) {
    return MouseRegion(
      onEnter: (event) => controller.isHovering = true,
      onExit: (event) => controller.isHovering = false,
      child: GestureDetector(
        onTap: () => Get.toNamed('/project-detail',
            arguments: {'projectName': details.name}),
        child: Card(
          elevation: 3,
          color: Themes.colorScheme(context).inverseSurface,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: Dimensions.width(context, perc: 10),
                    height: Dimensions.height(context, perc: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(details.imagePath),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                          color: borderColor ??
                              Themes.colorScheme(context).inversePrimary,
                          width: borderWidth),
                      shape: BoxShape.circle,
                    )),
                const Spacer(),
                Text(
                  details.name,
                  style: Themes.textTheme(context).titleLarge!.copyWith(
                      color: Themes.colorScheme(context).onInverseSurface),
                ),
                const Spacer(flex: 2),
                AutoSizeText(details.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: Themes.textTheme(context).bodyLarge!.copyWith(
                        color: Themes.colorScheme(context).onInverseSurface))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
