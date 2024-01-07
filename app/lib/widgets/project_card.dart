import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/data/controllers/projects_controller.dart';
import 'package:portfolio/data/models/project.dart';

class ProjectCard extends StatelessWidget {
  // final int index;
  final Project details;
  final double width;
  final double height;

  const ProjectCard({
    super.key,
    required this.details,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    // Project details = Configs.projectsDetails.values.toList()[index];
    return GetX<ProjectsController>(
      tag: details.id.toString(),
      builder: (controller) {
        // return Text(details.name);
        Widget body = getBody(context, details, controller)
            .animate(
          target: controller.isHovering ? 1 : 0,
          onPlay: (controller) => controller.repeat(reverse: true),
        )
            .swap(builder: (context, child) {
          return controller.isHovering
              ? getBody(context, details, controller, borderWidth: 2)
              : child!;
        }).scale(begin: const Offset(1, 1), end: const Offset(1.05, 1.05));
        if (context.isDesktop) {
          body = body.animate().fadeIn(
              delay: (500 + 200 * (details.id + 1)).ms, duration: 500.ms);
        }
        return body;
      },
    );
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
          color: context.colorScheme.inverseSurface,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Container(
                //     width: width * 0.2,
                //     height: height * 0.2,
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: AssetImage(details.imagePath),
                //         fit: BoxFit.cover,
                //       ),
                //       border: Border.all(
                //           color:
                //               borderColor ?? context.colorScheme.inversePrimary,
                //           width: borderWidth),
                //       shape: BoxShape.circle,
                //     )),
                const Spacer(),
                AutoSizeText(
                  details.name,
                  maxLines: 1,
                  style: context.textTheme.titleLarge!
                      .copyWith(color: context.colorScheme.onInverseSurface),
                ),
                const Spacer(flex: 2),
                AutoSizeText(details.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: context.colorScheme.onInverseSurface))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
