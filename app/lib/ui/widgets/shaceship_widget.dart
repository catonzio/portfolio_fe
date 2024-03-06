import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/utils.dart';
import 'package:portfolio/data/controllers/scroller.dart';
import 'package:portfolio/data/controllers/spaceship_controller.dart';
import 'package:portfolio/extensions/double_extension.dart';
import 'package:portfolio/ui/widgets/spaceship_images.dart';

class SpaceshipWidget extends StatelessWidget {
  const SpaceshipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SpaceshipController spaceship = SpaceshipController.to;

    return GetX<Scroller>(builder: (scroller) {
      double fromGroundPerc =
          spaceship.fromGroundPerc(scroller.scrollOffset, context.height);
      double pageNum =
          numScreen(scroller.scrollOffset, context.height).toDouble();
      // print(pageNum);

      return Positioned(
        bottom: spaceship.bottom(scroller.scrollOffset, context.height),
        // left: spaceship.left(scroller.scrollOffset, size.width, size.height),
        height: Constants.totalSpaceshipHeight,
        width: Constants.totalSpaceshipWidth,
        child: Container(
          alignment: Alignment.center,
          child: AnimatedSlide(
            offset: Offset(
                spaceship.offsetX(scroller.totalScrollPerc, context.width), 0),
            duration: const Duration(milliseconds: 500),
            child: AnimatedScale(
              scale: pageNum.isInBetween(0, 5)
                  ? 1
                  : pageNum.isInBetween(5, 8)
                      ? 0.8
                      : pageNum.isInBetween(8, 10)
                          ? 0.6
                          : 0.4,
              duration: const Duration(milliseconds: 1000),
              child:
                  SpaceshipImages(showFire: spaceship.showFire(fromGroundPerc)),
            ),
          ),
        ),
      );
    });
  }
}
