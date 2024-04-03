import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/about/work_experience_model.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/text_styles_mobile.dart';

class WorkExperienceRowMobile extends StatelessWidget {
  final WorkExperience workExperience;

  const WorkExperienceRowMobile({
    super.key,
    required this.workExperience,
  });

  @override
  Widget build(BuildContext context) {
    final double centerCircleSize =
        Size(context.width * 0.12, context.height * 0.12)
            .shortestSide
            .clamp(40, 60);
    final double elementsPadding = context.width * 0.005;

    final List<Widget> widgetsList = [
      SizedBox(
        width: centerCircleSize,
        height: centerCircleSize,
        child: Card(
          color: AppColors.darkGrey,
          elevation: 3,
          clipBehavior: Clip.antiAlias,
          borderOnForeground: true,
          shape: const CircleBorder(
              side: BorderSide(color: Color(0xFF969696), width: 3)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              workExperience.logoPath,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(elementsPadding),
        child: SizedBox(
            height: context.height * 0.1,
            width: context.width * 0.5,
            child: PhysicalModel(
              elevation: 3,
              color: context.theme.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
              child: ListTile(
                contentPadding: EdgeInsets.only(
                    left: elementsPadding * 2,
                    top: elementsPadding,
                    bottom: elementsPadding),
                isThreeLine: true,
                title: AutoSizeText(workExperience.company.toUpperCase(),
                    maxLines: 1,
                    style: TextStylesMobile.workExperienceBoxTitle),
                subtitle: FractionallySizedBox(
                  heightFactor: 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(workExperience.role.toUpperCase(),
                          maxLines: 1,
                          style: TextStylesMobile.workExperienceBoxSubtitle),
                      AutoSizeText(workExperience.date.toUpperCase(),
                          maxLines: 1,
                          style: TextStylesMobile.workExperienceDuration),
                    ],
                  ),
                ),
              ),
            )),
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: widgetsList,
    );
  }
}
