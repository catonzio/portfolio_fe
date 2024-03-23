import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/modules/about/views/widgets/overview_skill_box.dart';

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
            Text("About me",
                style: GoogleFonts.poppins(
                    fontSize: 60, fontWeight: FontWeight.bold)),
            DefaultTextStyle(
              style: GoogleFonts.poppins(fontSize: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "I'm a passionate data scientist and software engineer at IBM, specializing in Python and Flutter."),
                  Text(
                      "With a knack for crafting innovative solutions, I thrive on pushing boundaries in technology."),
                  Text(
                      "Explore my portfolio to see how I blend creativity with technical expertise.")
                ],
              ),
            ),
            Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                spacing: wrapSpacing,
                runSpacing: wrapSpacing,
                children: [
                  const OverviewSkillBox(
                    width: skillBowWidth,
                    height: skillBoxHeight,
                    iconPath: "assets/images/developer.png",
                    title: "Developer",
                  )
                      .animate()
                      .moveX(delay: 500.ms, begin: beginMove * 2, end: 0),
                  const OverviewSkillBox(
                    width: skillBowWidth,
                    height: skillBoxHeight,
                    iconPath: "assets/images/software_engineer.png",
                    title: "Software Engineer",
                  )
                      .animate()
                      .fade(delay: 1500.ms)
                      .moveX(begin: beginMove, end: 0),
                  const OverviewSkillBox(
                    width: skillBowWidth,
                    height: skillBoxHeight,
                    iconPath: "assets/images/architect.png",
                    title: "Architect",
                  )
                      .animate()
                      .fade(delay: 2500.ms)
                      .moveX(begin: beginMove, end: 0),
                  const OverviewSkillBox(
                          width: skillBowWidth,
                          height: skillBoxHeight,
                          icon: Icons.brightness_auto_rounded,
                          title: "Data Scientist")
                      .animate()
                      .fade(delay: 3500.ms)
                      .moveX(begin: beginMove, end: 0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
