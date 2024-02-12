import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/context_extension.dart';
import 'dart:math' as math;

import 'package:portfolio/data/controllers/navbar_controller.dart';

class NavbarButtonDesktop extends StatelessWidget {
  final String text;

  const NavbarButtonDesktop(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<NavbarController>(
      builder: (controller) {
        return InkWell(
            onHover: (value) => controller.setIsHovering(value, text),
            onTap: () => controller.scrollToSection(context, text),
            // onEnter: (_) => controller.setIsHovering(true),
            // onExit: (_) => controller.setIsHovering(false),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: HoveredContainer(
                  isHovered: controller.isHovering[text]!.value ||
                      controller.homeController.currentSection == text,
                  child: Container(
                      width: math.min(context.widthP(10), 100),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: AutoSizeText(
                        text.toUpperCase(),
                        style: context.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                        presetFontSizes: [
                          context.titleLargeFontSize,
                          context.titleMediumFontSize,
                          context.titleSmallFontSize,
                          context.bodyLargeFontSize,
                          context.bodyMediumFontSize,
                          context.bodySmallFontSize,
                          context.labelSmallFontSize
                        ],
                        maxLines: 1,
                      ))),
            ));
      },
    );
  }
}

class HoveredContainer extends StatelessWidget {
  final bool isHovered;
  final Widget child;
  const HoveredContainer(
      {super.key, this.isHovered = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
                child: Container(
          decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 1, color: context.colorScheme.onSurface)),
            // borderRadius: BorderRadius.circular(10)
          ),
        ))
            .animate(
              target: isHovered ? 1 : 0,
              onPlay: (controller) => controller.repeat(reverse: true),
            )
            .scaleX(
                begin: 0, end: 1, duration: 500.ms, curve: Curves.easeInSine)
        // .scaleX(begin: 0, end: 1, duration: 500.ms)
        //     .shimmer(duration: 100.ms, size: 10, colors: [
        //   context.colorScheme.primary,
        //   context.colorScheme.background
        // ])
      ],
    );
  }
}
