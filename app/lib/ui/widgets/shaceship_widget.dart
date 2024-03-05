import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/data/controllers/scroller.dart';
import 'package:portfolio/data/controllers/spaceship_controller.dart';
import 'package:portfolio/enums/spaceship_position.dart';
import 'package:portfolio/ui/pages/spaceship_page.dart';
import 'package:portfolio/ui/widgets/spaceship_images.dart';

class SpaceshipWidget extends StatelessWidget {
  const SpaceshipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final SpaceshipController spaceship = SpaceshipController.to;
    return GetX<Scroller>(builder: (scroller) {
      double fromGroundPerc =
          spaceship.fromGroundPerc(scroller.scrollOffset, size.height);
      final double perc = scroller.totalScrollPerc;
      if (perc.isInBetween(0.2, 0.3)) {
        spaceship.position = SpaceshipPosition.left;
      } else if (perc.isInBetween(0.3, 0.4)) {
        spaceship.position = SpaceshipPosition.right;
      } else {
        spaceship.position = SpaceshipPosition.center;
      }
      print("isRight: ${spaceship.position.name}");

      final double leftX = size.width * 0.1 - Constants.totalSpaceshipWidth / 2;
      final double rightX =
          size.width * 0.9 - Constants.totalSpaceshipWidth / 2;
      final double centerX = size.width / 2 - Constants.totalSpaceshipWidth / 2;

      return Positioned(
        bottom: spaceship.bottom(scroller.scrollOffset, size.height),
        // left: spaceship.left(scroller.scrollOffset, size.width, size.height),
        height: Constants.totalSpaceshipHeight,
        width: Constants.totalSpaceshipWidth,
        child: AnimatedSlide(
            offset: Offset(
                spaceship.position == SpaceshipPosition.left
                    ? leftX / Constants.totalSpaceshipWidth
                    : (spaceship.position == SpaceshipPosition.right
                        ? rightX / Constants.totalSpaceshipWidth
                        : centerX / Constants.totalSpaceshipWidth),
                0),
            duration: const Duration(milliseconds: 500),
            child:
                SpaceshipImages(showFire: spaceship.showFire(fromGroundPerc))),
      );
    });
  }
}
