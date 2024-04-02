import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/text_styles_mobile.dart';

class PresentationTextMobile extends StatelessWidget {
  const PresentationTextMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("HI, I'M", style: TextStylesMobile.presentationTitle),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("DANILO", style: TextStylesMobile.name),
            Text("CATONE", style: TextStylesMobile.name),
          ],
        ),
        AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(milliseconds: 1500),
          displayFullTextOnTap: true,
          animatedTexts: [
            TypewriterAnimatedText(
              "Data Scientist",
              speed: 150.ms,
              cursor: "|",
              textStyle: context.textTheme.titleMedium,
            ),
            TypewriterAnimatedText(
              "Flutter Developer",
              speed: 150.ms,
              cursor: "|",
              textStyle: context.textTheme.titleMedium,
            ),
            TypewriterAnimatedText(
              "Software Engineer",
              speed: 150.ms,
              cursor: "|",
              textStyle: context.textTheme.titleMedium,
            ),
            TypewriterAnimatedText(
              "A friend 👋🏼😊",
              speed: 150.ms,
              cursor: "|",
              textStyle: context.textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
