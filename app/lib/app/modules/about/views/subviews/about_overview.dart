import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/about/views/widgets/overview_skill_box.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/text_styles.dart';

class AboutOverview extends StatelessWidget {
  const AboutOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double skillBowWidth = 180;
    const double skillBoxHeight = 180;
    const double wrapSpacing = 24;
    const double beginMove = -(skillBowWidth + wrapSpacing);

    return Container(
      color: context.theme.colorScheme.surface,
      width: min(context.width, 1250),
      height: context.height * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Overview", style: TextStyles.sectionTitle)
                .animate()
                .fade(delay: 500.ms, duration: 1000.ms)
                .flipV(duration: 250.ms)
                .moveY(
                    delay: 500.ms,
                    begin: -context.height * 0.05,
                    end: 0,
                    duration: 250.ms),
            DefaultTextStyle(
              style: context.theme.textTheme.titleLarge!,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: Constants.aboutOverview
                      .split("\n")
                      .map((String text) => Text(text.trim()))
                      .toList()),
            ),
            Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                spacing: wrapSpacing,
                runSpacing: wrapSpacing,
                children: Constants.overviewSkillBoxes.map((skill) {
                  final int index = Constants.overviewSkillBoxes.indexOf(skill);
                  return OverviewSkillBox(
                    width: skillBowWidth,
                    height: skillBoxHeight,
                    iconPath: skill["iconPath"]!,
                    title: skill["title"]!,
                  )
                      .animate()
                      .fade(delay: (1000 * index + 500).ms)
                      .moveX(begin: beginMove, end: 0);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
