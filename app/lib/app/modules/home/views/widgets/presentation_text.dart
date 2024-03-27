import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
            TyperAnimatedText(
              "Data Scientist",
              speed: const Duration(milliseconds: 80),
              textStyle: context.textTheme.headlineLarge,
            ),
            TyperAnimatedText(
              "Flutter Developer",
              speed: const Duration(milliseconds: 80),
              textStyle: context.textTheme.headlineLarge,
            ),
            TyperAnimatedText(
              "Software Engineer",
              speed: const Duration(milliseconds: 80),
              textStyle: context.textTheme.headlineLarge,
            ),
            TyperAnimatedText(
              "A friend 👋🏼😊",
              speed: const Duration(milliseconds: 80),
              textStyle: context.textTheme.headlineLarge,
            ),
          ],
        ),
      ],
    );
  }
}