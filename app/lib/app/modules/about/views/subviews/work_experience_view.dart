import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/about/views/widgets/work_experience_row.dart';
import 'package:portfolio/app/shared/ui/triangle_painter.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/text_styles.dart';

class WorkExperienceView extends StatelessWidget {
  const WorkExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: context.theme.colorScheme.onSurfaceVariant),
      child: Container(
          color: context.theme.colorScheme.surfaceVariant,
          width: context.width,
          // height: context.height,
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Material(
            color: context.theme.colorScheme.surfaceVariant,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(150),
              bottomRight: Radius.circular(150),
            ),
            elevation: 0,
            child: Container(
              height: context.height * 1.6,
              decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/work_experience_bg.png"),
                  )),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                      child: CustomPaint(
                    painter: TrianglePainter(
                        color: context.theme.colorScheme.surfaceVariant
                            .withOpacity(0.95)),
                  )),
                  Positioned(
                      top: context.height * 0.07,
                      left: context.width * 0.15,
                      right: context.width * 0.15,
                      bottom: context.height * 0.07,
                      child: const WorkExperienceContent())
                ],
              ),
            ),
          )),
    );
  }
}

class WorkExperienceContent extends StatelessWidget {
  const WorkExperienceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText("Work Experience",
            maxLines: 1, style: TextStyles.sectionTitle),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 64),
            child: WorkExperienceTimeline(),
          ),
        )
      ],
    );
  }
}

class WorkExperienceTimeline extends StatelessWidget {
  const WorkExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: VerticalDivider(
            thickness: 4,
            color: AppColors.lightGrey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...Constants.workExperiences.map((e) => WorkExperienceRow(
                      workExperience: e,
                    )),
              ]
                  .animate(interval: 500.ms)
                  .fade(delay: 500.ms, duration: 1000.ms),
            ),
          ),
        ),
      ],
    );
  }
}
