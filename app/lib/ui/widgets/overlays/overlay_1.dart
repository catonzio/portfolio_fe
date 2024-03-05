import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/controllers/scroller.dart';

class OverlayWidgets extends StatelessWidget {
  const OverlayWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Scroller scroller = Scroller.to;
    final double wHeight = size.height * 0.4;
    final double wWidth = size.width * 0.4;
    final double xPos = size.width * 0.1;
    final double yPos = size.height * 0.6;

    return Obx(() {
      final double perc = scroller.totalScrollPerc;
      final bool isInPosition = 0.2 < perc && perc < 0.4;

      return Positioned(
        bottom: scroller.scrollOffset + yPos,
        width: wWidth,
        height: wHeight,
        child: AnimatedSlide(
          offset: Offset(isInPosition ? xPos / wWidth : -1, 0),
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          child: AnimatedOpacity(
            opacity: isInPosition ? 1 : 0,
            duration: const Duration(milliseconds: 1500),
            child: Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: Text(
                "Overlay",
                style: context.textTheme.headlineLarge,
              ),
            ),
          ),
        ),
      );
    });
  }
}
