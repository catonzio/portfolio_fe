import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/views/desktop/widgets/projects_row.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/shared_animations.dart';
import 'package:portfolio/config/text_styles.dart';

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
                  .animate(
                    effects: GlobalAnimations.titleAppearence,
                  )
                  .animate(
                      effects: GlobalAnimations.darkTitleShimmer,
                      onPlay: (controller) =>
                          controller.repeat(reverse: false)),
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
