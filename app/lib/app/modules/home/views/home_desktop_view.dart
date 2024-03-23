import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/shared/ui/asd.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/text_styles.dart';

class HomeDesktopView extends StatelessWidget {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.surface,
      height: context.height,
      width: context.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/home_background.png"),
          CustomPaint(
            painter: TrianglePainter(color: AppColors.blackOpacity),
          ),
          Positioned(
              top: context.height * (0.4 - 0.3 / 2),
              left: context.width * 0.1,
              height: context.height * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("HI, I'M", style: TextStyles.presentationTitle),
                  const Text("DANILO CATONE", style: TextStyles.name),
                  Text("I'm a Flutter Developer",
                      style: context.textTheme.headlineLarge),
                ],
              ))
        ],
      ),
    );
  }
}
