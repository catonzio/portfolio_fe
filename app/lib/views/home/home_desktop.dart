import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:dcatone/animations/entrance_fader.dart';
import 'package:dcatone/configs/configs.dart';

import 'package:dcatone/info/utils.dart';
import 'package:dcatone/widgets/social_link.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 1,
      padding: Space.h,
      child: Stack(
        children: [
          Positioned(
            top: size.height * 0.1,
            bottom: size.height * 0.1,
            right: size.width * 0.1,
            child: Opacity(
              opacity: 0.9,
              child: EntranceFader(
                offset: const Offset(0, 0),
                delay: const Duration(seconds: 1),
                duration: const Duration(milliseconds: 800),
                child: Image.asset(
                  StaticUtils.blackWhitePhoto,
                  scale: AppDimensions.normalize(0.1),
                  // width: AppDimensions.normalize(0.8),
                  // scale: size.width < 1500
                  //     ? size.width * 0.0005
                  //     : size.width * 0.0001,
                  // height: size.width < 1200
                  //     ? size.height * 0.9
                  //     : size.height * 0.95,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              AppDimensions.normalize(40),
              AppDimensions.normalize(100),
              0,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'WELCOME TO MY WEBSITE! ',
                      style: AppText.b1!.copyWith(
                          fontFamily: 'Montserrat',
                          fontSize: size.width < 1500
                              ? size.width * 0.03
                              : size.width * (0.03 - 0.005)),
                    ),
                    EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 3),
                      duration: const Duration(milliseconds: 800),
                      child: Image.asset(
                        StaticUtils.hi,
                        height: AppDimensions.normalize(size.width < 1500
                            ? size.width * 0.01
                            : size.width * (0.01 - 0.005)),
                      ),
                    ),
                  ],
                ),
                Space.y1!,
                Text(
                  "Danilo",
                  style: AppText.h1!.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: AppDimensions.normalize(size.width < 1500
                        ? size.width * 0.03
                        : size.width * (0.03 - 0.005)),
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Text(
                  "Catone",
                  style: AppText.h1b!.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: AppDimensions.normalize(size.width < 1500
                        ? size.width * 0.03
                        : size.width * (0.03 - 0.005)),
                    height: 1,
                  ),
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: AppTheme.c!.primary!,
                        size: AppDimensions.normalize(15),
                      ),
                      AnimatedTextKit(
                        animatedTexts: StaticUtils.animatedSubtitles
                            .map((e) => TyperAnimatedText(
                                  e,
                                  speed: const Duration(milliseconds: 75),
                                  textStyle: AppText.b1!.copyWith(
                                      fontSize: AppDimensions.normalize(15)),
                                ))
                            .toList(),
                        isRepeatingAnimation: true,
                      ),
                    ],
                  ),
                ),
                Space.y2!,
                const SocialLink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
