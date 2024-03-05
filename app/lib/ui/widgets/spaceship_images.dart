import 'package:flutter/material.dart';
import 'package:portfolio/config/constants.dart';

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
          width: Constants.spaceshipWidth,
        ),
        // if (spaceship.showFire(fromGroundPerc))
        AnimatedOpacity(
          opacity: showFire ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: Image.asset(
            "assets/only_fire.png",
            width: Constants.fireWidth,
            height: Constants.fireHeight,
            // height: spaceshipHeight,
          ),
        )
      ],
    );
  }
}
