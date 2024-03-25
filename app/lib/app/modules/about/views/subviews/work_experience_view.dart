import 'package:auto_size_text/auto_size_text.dart';
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
        AutoSizeText("Work Experience",
            maxLines: 1, style: TextStyles.sectionTitle),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...Constants.workExperiences.map((e) => WorkExperienceRow(
                      workExperience: e,
                    )),
              ],
            ),
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
    final double centerCircleSize =
        Size(context.width * 0.07, context.height * 0.07).shortestSide;
    final double elementsPadding = context.width * 0.005;
    final List<Widget> widgetsList = [
      Padding(
        padding: EdgeInsets.all(elementsPadding),
        child: SizedBox(
            height: context.height * 0.1,
            width: context.width * 0.2,
            child: PhysicalModel(
              elevation: 3,
              color: context.theme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
              child: ListTile(
                contentPadding: EdgeInsets.all(elementsPadding),
                isThreeLine: true,
                title: AutoSizeText(workExperience.company.toUpperCase(),
                    maxLines: 1, style: TextStyles.workExperienceBoxTitle),
                subtitle: AutoSizeText(workExperience.role.toUpperCase(),
                    maxLines: 1, style: TextStyles.workExperienceBoxSubtitle),
              ),
            )),
      ),
      Padding(
          padding: EdgeInsets.all(elementsPadding),
          child: SizedBox(
            width: centerCircleSize,
            height: centerCircleSize,
            child: const Card(
              color: AppColors.lightGrey,
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/architect.png"),
              ),
            ),
          )),
      Container(
        width: context.width * 0.21,
        alignment: workExperience.id.isOdd
            ? Alignment.centerLeft
            : Alignment.centerRight,
        padding: EdgeInsets.all(elementsPadding),
        child: AutoSizeText(workExperience.date,
            maxLines: 1, style: TextStyles.workExperienceDuration),
      )
    ];
    return SizedBox(
      width: context.width * 0.55,
      child: Row(
        mainAxisAlignment: workExperience.id.isOdd
            ? MainAxisAlignment.center
            : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: workExperience.id.isOdd
            ? widgetsList
            : widgetsList.reversed.toList(),
      ),
    );
  }
}
