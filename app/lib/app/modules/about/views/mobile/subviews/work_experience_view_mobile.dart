import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/about/views/mobile/widgets/work_experience_row_mobile.dart';
import 'package:portfolio/app/shared/ui/triangle_painter.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/text_styles_mobile.dart';

class WorkExperienceViewMobile extends StatelessWidget {
  const WorkExperienceViewMobile({super.key});

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
            elevation: 3,
            child: Container(
              height: context.height * 0.2 * Constants.workExperiences.length,
              decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/backgrounds/work_experience_bg.png"),
                  )),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                      child: CustomPaint(
                    painter: WorkExperiencePainter(
                        color: context.theme.colorScheme.surfaceVariant
                            .withOpacity(0.95),
                        isDesktop: false),
                  )),
                  Positioned(
                      top: context.height * 0.05,
                      left: context.width * 0.15,
                      right: context.width * 0.15,
                      bottom: context.height * 0.05,
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
            maxLines: 1, style: TextStylesMobile.sectionTitle),
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
    final double centerCircleSize =
        Size(context.width * 0.12, context.height * 0.12)
            .shortestSide
            .clamp(40, 60);

    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: centerCircleSize / 2 - 1,
          child: const VerticalDivider(
            thickness: 4,
            indent: 0,
            endIndent: 0,
            width: 4,
            color: AppColors.lightGrey,
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...Constants.workExperiences.map((e) => WorkExperienceRowMobile(
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
