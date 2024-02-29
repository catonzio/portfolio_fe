import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/spaceship/utils.dart';
import 'package:portfolio/spaceship/scroller.dart';
import 'package:portfolio/spaceship/spaceship.dart';

enum Position { left, center, right }

class Spaceship extends GetxController {
  final Rx<Position> _position = Position.center.obs;
  Position get position => _position.value;
  set position(Position value) => _position.value = value;

  double fromGroundPerc(double scrollOffset, double height) {
    double fromGroundPerc = ((scrollOffset) / (height * 5 - 1)).clamp(0, 1);
    fromGroundPerc = exp(1 - 1 / pow(fromGroundPerc, 2)).clamp(0, 1);
    return fromGroundPerc;
  }

  bool showFire(double fromGroundPerc) =>
      0 < fromGroundPerc && fromGroundPerc < 0.3;

  double bottom(double scrollOffset, double height) {
    return spaceshipBottom +
        scrollOffset +
        fromGroundPerc(scrollOffset, height) *
            (height * 0.3 - totalSpaceshipHeight / 2);
  }

  double left(double scrollOffset, double width, double height) {
    // print("${scrollOffset.toInt()} ${scrollOffset.toInt() % 1000 == 0}");
    // return scrollOffset.toInt() % 1000 == 0
    //     ? width / 2 - totalSpaceshipWidth / 2
    //     : width * 0.1;
    // final int screenNum = numScreen(scrollOffset, height);
    // final double perc = screenScrollPerca(scrollOffset, height);

    if (showFire(fromGroundPerc(scrollOffset, height))) {
      return width / 2 - totalSpaceshipWidth / 2;
    }
    return width / 2 - totalSpaceshipWidth / 2;
    // return (screenNum % 2 == 0 ? width * perc : width * (1 - perc)) -
    //     totalSpaceshipWidth / 2;
  }
}

class SpaceshipWidget extends StatelessWidget {
  const SpaceshipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Spaceship spaceship = Get.put(Spaceship());
    return GetX<Scroller>(builder: (scroller) {
      double fromGroundPerc =
          spaceship.fromGroundPerc(scroller.scrollOffset, size.height);
      final double perc = scroller.totalScrollPerc;
      if (perc.isInBetween(0.2, 0.3)) {
        spaceship.position = Position.left;
      } else if (perc.isInBetween(0.3, 0.4)) {
        spaceship.position = Position.right;
      } else {
        spaceship.position = Position.center;
      }
      print("isRight: ${spaceship.position.name}");

      final double leftX = size.width * 0.1 - totalSpaceshipWidth / 2;
      final double rightX = size.width * 0.9 - totalSpaceshipWidth / 2;
      final double centerX = size.width / 2 - totalSpaceshipWidth / 2;

      return Positioned(
        bottom: spaceship.bottom(scroller.scrollOffset, size.height),
        // left: spaceship.left(scroller.scrollOffset, size.width, size.height),
        height: totalSpaceshipHeight,
        width: totalSpaceshipWidth,
        child: AnimatedSlide(
            offset: Offset(
                spaceship.position == Position.left
                    ? leftX / totalSpaceshipWidth
                    : (spaceship.position == Position.right
                        ? rightX / totalSpaceshipWidth
                        : centerX / totalSpaceshipWidth),
                0),
            duration: const Duration(milliseconds: 500),
            child:
                SpaceshipImages(showFire: spaceship.showFire(fromGroundPerc))),
      );
    });
  }
}

class SpaceshipImages extends StatelessWidget {
  const SpaceshipImages({
    super.key,
    required this.showFire,
  });

  final bool showFire;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/only_spaceship.png",
          width: spaceshipWidth,
        ),
        // if (spaceship.showFire(fromGroundPerc))
        AnimatedOpacity(
          opacity: showFire ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: Image.asset(
            "assets/only_fire.png",
            width: fireWidth,
            height: fireHeight,
            // height: spaceshipHeight,
          ),
        )
      ],
    );
  }
}
