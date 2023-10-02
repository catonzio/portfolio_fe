import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/dimensions.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/controllers/section_controller.dart';
// import 'package:portfolio/config/dimensions.dart';

class HomeDesktop extends StatelessWidget {
  final SectionController sectionController;
  const HomeDesktop(this.sectionController, {super.key});

  @override
  Widget build(BuildContext context) {
    // This is the landing page of the website
    // It contains a centered text (I am Danilo Catone) and an animated text
    return Material(
      color: Colors.transparent,
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("I am ",
                  style: Themes.textTheme(context).displayLarge!.copyWith(
                      color: Colors.grey[700], fontWeight: FontWeight.bold)),
              Text(
                "Danilo Catone",
                style: Themes.textTheme(context)
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: Dimensions.pageHeight(context, perc: 5),
          ),
          // Spacer(),
          // .scale(begin: const Offset(0, 0), end: const Offset(5, 5)),
          AnimatedTextKit(
              repeatForever: true,
              animatedTexts: Configs.animatedTextsHome
                  .map((e) => getAnimatedText(context, e))
                  .toList()),
        ],
      ).animate().fadeIn(duration: 3000.ms, delay: 750.ms),
    );
  }

  TypewriterAnimatedText getAnimatedText(BuildContext context, String text) {
    return TypewriterAnimatedText(
      text,
      textStyle: Themes.textTheme(context).displaySmall,
      speed: 150.ms,
      cursor: '|',
      curve: Curves.linear,
    );
  }
}
