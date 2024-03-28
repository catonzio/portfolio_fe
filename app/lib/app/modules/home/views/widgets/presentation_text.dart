import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/text_styles.dart';

class PresentationText extends StatelessWidget {
  const PresentationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("HI, I'M", style: TextStyles.presentationTitle),
        const Text("DANILO CATONE", style: TextStyles.name),
        AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(milliseconds: 1500),
          displayFullTextOnTap: true,
          animatedTexts: [
            TypewriterAnimatedText(
              "Data Scientist",
              speed: 150.ms,
              cursor: "|",
              textStyle: context.textTheme.headlineLarge,
            ),
            TypewriterAnimatedText(
              "Flutter Developer",
              speed: 150.ms,
              cursor: "|",
              textStyle: context.textTheme.headlineLarge,
            ),
            TypewriterAnimatedText(
              "Software Engineer",
              speed: 150.ms,
              cursor: "|",
              textStyle: context.textTheme.headlineLarge,
            ),
            TypewriterAnimatedText(
              "A friend 👋🏼😊",
              speed: 150.ms,
              cursor: "|",
              textStyle: context.textTheme.headlineLarge,
            ),
          ],
        ),
      ],
    );
  }
}
