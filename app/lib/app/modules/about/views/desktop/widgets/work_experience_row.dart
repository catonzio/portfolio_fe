import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/about/work_experience_model.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/text_styles.dart';

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
    final bool isOdd = workExperience.id.isOdd;
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
                contentPadding: EdgeInsets.only(
                    left: elementsPadding * 2,
                    top: elementsPadding,
                    bottom: elementsPadding),
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
            child: Card(
              color: AppColors.darkGrey,
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              borderOnForeground: true,
              shape: const CircleBorder(
                  side: BorderSide(color: Color(0xFF969696), width: 3)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  workExperience.logoPath,
                  fit: BoxFit.scaleDown,
                  color: AppColors.darkWhite,
                ),
              ),
            ),
          )),
      Container(
        width: context.width * 0.21,
        alignment: isOdd ? Alignment.centerLeft : Alignment.centerRight,
        padding: EdgeInsets.all(elementsPadding),
        child: AutoSizeText(workExperience.date,
            maxLines: 1, style: TextStyles.workExperienceDuration),
      )
    ];
    return SizedBox(
      width: context.width * 0.55,
      child: Row(
        mainAxisAlignment:
            isOdd ? MainAxisAlignment.center : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: isOdd ? widgetsList : widgetsList.reversed.toList(),
      ),
    );
  }
}
