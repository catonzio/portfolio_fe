import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/home/views/mobile/widgets/presentation_text_mobile.dart';
import 'package:portfolio/app/shared/ui/triangle_painter.dart';
import 'package:portfolio/config/colors.dart';

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: const AssetImage(
        //           "assets/images/backgrounds/black_home_background.png"),
        //       fit: BoxFit.cover,

        //       colorFilter: ColorFilter.mode(
        //         context.theme.colorScheme.surface.withOpacity(0.8),
        //         BlendMode.xor,
        //       ),
        //     ),
        //   ),
        // child: Image.asset(
        //   "assets/images/backgrounds/black_home_background.png",
        //   fit: BoxFit.cover,
        //   color: context.theme.colorScheme.surface.withOpacity(0.8),
        //   colorBlendMode: BlendMode.xor,
        // ),
        // ),
        Image.asset(
          "assets/images/backgrounds/black_home_background.png",
          fit: BoxFit.cover,
          // color: Colors.blue.withOpacity(0.8),
          // colorBlendMode: BlendMode.multiply,
          // alignment: Alignment.topCenter,
          color: context.theme.colorScheme.surface.withOpacity(0.8),
          colorBlendMode: BlendMode.xor,
        ),
        CustomPaint(
          painter: HomeTrianglePainter(
              color: AppColors.blackOpacity, isDesktop: false),
        ),
        Positioned(
            top: context.height * (0.4 - 0.3 / 2),
            left: context.width * 0.1,
            height: context.height * 0.3,
            child: const PresentationTextMobile().animate().moveX(
                delay: 250.ms,
                begin: -context.width,
                end: 0,
                curve: Curves.easeInOut,
                duration: 1000.ms)),
        Positioned(
                bottom: 0,
                right: context.width * 0,
                width: context.width * 0.5,
                child: Image.asset(
                  "assets/images/myself.png",
                  fit: BoxFit.fill,
                ))
            .animate()
            .moveY(
                delay: 1000.ms,
                begin: context.height,
                end: context.height * 0,
                curve: Curves.easeInOut,
                duration: 500.ms)
      ],
    );
  }
}
