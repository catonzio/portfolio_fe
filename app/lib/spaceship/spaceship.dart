import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/spaceship/menu_row.dart';
import 'package:portfolio/spaceship/scroller.dart';
import 'package:portfolio/spaceship/shaceship_widget.dart';
import 'package:portfolio/spaceship/utils.dart';

class SpaceShipPage extends StatelessWidget {
  const SpaceShipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Scroller scroller = Get.put(Scroller());
    final Size size = MediaQuery.of(context).size;
    final String bkgImage = DateTime.now().hour.toDouble().isInBetween(10, 20)
        ? "assets/stars_gradient.png"
        : "assets/stars_sunset.png";
    return Scaffold(
        body: SingleChildScrollView(
            controller: scroller.scrollController,
            child: Container(
              width: size.width.clamp(0, 1920),
              height: totalHeight,
              alignment: Alignment.center,
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  Obx(() => Positioned(
                        left: 0,
                        bottom: scroller.totalScrollPerc < 0.1
                            ? scroller.scrollOffset * 0.95
                            : totalHeight * 0.0917,
                        height: totalHeight,
                        child: Image.asset(
                          bkgImage,
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                  const OverlayWidgets(),
                  const OverlayWidgets2(),
                  const SpaceshipWidget(),
                  const MenuRow(),
                ],
              ),
            )));
  }
}

class OverlayWidgets2 extends StatelessWidget {
  const OverlayWidgets2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Scroller scroller = Get.find<Scroller>();
    final double wHeight = size.height * 0.4;
    final double wWidth = size.width * 0.4;
    final double xPos = size.width * 0.1;
    final double yPos = size.height * 0.1;

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
              color: Colors.green,
              alignment: Alignment.center,
              child: Text(
                "Overlay 2",
                style: context.textTheme.headlineLarge,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class OverlayWidgets extends StatelessWidget {
  const OverlayWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Scroller scroller = Get.find<Scroller>();
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

extension MyDouble on double {
  bool isInBetween(double min, double max) {
    return min < this && this < max;
  }

  bool isNear(double target, double delta) {
    return (this - target).abs() < delta;
  }
}
