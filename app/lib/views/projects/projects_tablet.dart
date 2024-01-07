import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/data/controllers/home_controller.dart';
import 'package:portfolio/data/controllers/projects_controller.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/data/models/section.dart';
import 'package:portfolio/widgets/project_card.dart';

class ProjectsTablet extends StatelessWidget {
  final Section section;
  const ProjectsTablet(this.section, {super.key});

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
    Size size = Size(context.widthP(90), context.pageHeight(perc: 50));
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
            : Swiper(
                // control: SwiperControl(),
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                  activeColor: context.colorScheme.primary,
                  size: context.widthP(1),
                )),
                autoplay: true,
                autoplayDelay: 5000,
                autoplayDisableOnInteraction: true,
                duration: 1000,
                itemCount: Configs.projectsDetails.length,
                itemBuilder: (context, index) {
                  Project e = Configs.projectsDetails.values.toList()[index];
                  Get.put(ProjectsController(), tag: e.id.toString());
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: size.width * 0.9,
                        height: size.height * 0.8,
                        // margin: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: ProjectCard(
                          details: e,
                          width: size.width * 0.9,
                          height: size.height * 0.8,
                          // index: getIndex(i, nCols, j),
                        )),
                  );
                },
              ));
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
