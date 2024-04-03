import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/shared/ui/widgets/social_buttons.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/text_styles.dart';

class PresentationText extends StatelessWidget {
  const PresentationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double socialSize =
        Size(context.width * 0.04, context.height * 0.04).shortestSide;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("HI, I'M", style: TextStyles.presentationTitle),
        const Text("DANILO CATONE", style: TextStyles.name),
        Row(
          children: Constants.socialLinks.values
              .map((e) => Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 10.0),
                    child: SocialButton(
                        socialData: e, height: socialSize, width: socialSize),
                  ))
              .toList(),
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
