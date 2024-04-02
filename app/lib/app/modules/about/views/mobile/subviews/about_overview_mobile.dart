import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/about/views/mobile/widgets/overview_skill_box_mobile.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/shared_animations.dart';
import 'package:portfolio/config/text_styles_mobile.dart';

class AboutOverviewMobile extends StatelessWidget {
  const AboutOverviewMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.surface,
      width: min(context.width, 1250),
      // height: context.height,
      child: const Padding(
        padding: EdgeInsets.all(64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [AboutTitleMobile(), AboutTextMobile(), AboutBoxesMobile()],
        ),
      ),
    );
  }
}

class AboutTitleMobile extends StatelessWidget {
  const AboutTitleMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Overview", style: TextStylesMobile.sectionTitle).animate(
      effects: GlobalAnimations.titleAppearence,
    )
        // .animate(
        //     effects: GlobalAnimations.titleShimmer,
        //     onPlay: (controller) => controller.repeat(reverse: false));
        ;
  }
}

class AboutTextMobile extends StatelessWidget {
  const AboutTextMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: DefaultTextStyle(
        style: context.theme.textTheme.bodyLarge!,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: Constants.aboutOverview
                .split("\n")
                .map((String text) => Text(
                      text.trim(),
                    ))
                .toList()
                .animate(interval: 500.ms, delay: 1000.ms)
                .fade(delay: 500.ms, duration: 1000.ms)),
      ),
    );
  }
}

class AboutBoxesMobile extends StatelessWidget {
  const AboutBoxesMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double skillBowWidth = 100;
    const double skillBoxHeight = 100;
    const double wrapSpacing = 18;
    const double beginMove = -(skillBowWidth + wrapSpacing);

    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: wrapSpacing,
        runSpacing: wrapSpacing,
        children: Constants.overviewSkillBoxes
            .map((skill) {
              return OverviewSkillBoxMobile(
                width: skillBowWidth,
                height: skillBoxHeight,
                iconPath: skill["iconPath"]!,
                title: skill["title"]!,
              );
            })
            .toList()
            .animate(delay: 2000.ms, interval: 1000.ms)
            .fade(duration: 500.ms)
            .moveX(begin: beginMove, end: 0),
      ),
    );
  }
}
