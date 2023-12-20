import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/data/controllers/projects_controller.dart';
import 'package:portfolio/data/models/project.dart';

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
        }).scale(begin: const Offset(1, 1), end: const Offset(1.05, 1.05));
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
                    width: context.widthP(10),
                    height: context.heightP(10),
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
