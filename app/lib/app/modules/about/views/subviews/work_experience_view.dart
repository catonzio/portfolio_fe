import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/about/work_experience_model.dart';
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
              height: context.height * 0.8,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      bottom: 0,
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
        Text("Work Experience", style: TextStyles.sectionTitle),
        const Expanded(
          child: WorkExperienceTimeline(),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ...Constants.workExperiences.map((e) => WorkExperienceRow(
                    workExperience: e,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class WorkExperienceRow extends StatelessWidget {
  final WorkExperience workExperience;

  const WorkExperienceRow({
    super.key,
    required this.workExperience,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 80,
            width: 300,
            child: Card(
              elevation: 3,
              color: context.theme.colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                // contentPadding: const EdgeInsets.all(8),
                visualDensity: VisualDensity.adaptivePlatformDensity,
                title: Text(workExperience.company.toUpperCase(),
                    style: TextStyles.workExperienceBoxTitle),
                subtitle: Text(workExperience.role.toUpperCase(),
                    style: TextStyles.workExperienceBoxSubtitle),
              ),
            )),
        Container(
          width: 100,
          decoration: const BoxDecoration(
            color: AppColors.lightGrey,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/architect.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: const Text("Hello"),
        )
      ],
    );
  }
}
