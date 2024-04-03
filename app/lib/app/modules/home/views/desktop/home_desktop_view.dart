import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/home/views/desktop/widgets/presentation_text.dart';
import 'package:portfolio/app/shared/ui/triangle_painter.dart';
import 'package:portfolio/config/colors.dart';

class HomeDesktopView extends StatelessWidget {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/backgrounds/black_home_background_orig.png",
          fit: BoxFit.cover,
          color: context.theme.colorScheme.surface.withOpacity(0.8),
          colorBlendMode: BlendMode.xor,
        ),
        CustomPaint(
          painter: HomeTrianglePainter(
              color: AppColors.blackOpacity, isDesktop: true),
        ),
        Positioned(
            top: context.height * (0.4 - 0.25 / 2),
            left: context.width * 0.2,
            height: context.height * 0.3,
            child: const PresentationText().animate().moveX(
                delay: 250.ms,
                begin: -context.width,
                end: 0,
                curve: Curves.easeInOut,
                duration: 1000.ms)),
        Positioned(
                bottom: 0,
                right: context.width * 0.1,
                width: context.width * 0.25,
                child: Image.asset("assets/images/myself.png"))
            .animate()
            .moveY(
                delay: 1000.ms,
                begin: context.height,
                end: context.height * 0.1,
                curve: Curves.easeInOut,
                duration: 500.ms)
      ],
    );
  }
}
