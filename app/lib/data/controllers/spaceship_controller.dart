import 'dart:math';
import 'package:get/get.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/enums/spaceship_position.dart';

class SpaceshipController extends GetxController {
  static SpaceshipController get to => Get.find<SpaceshipController>();

  final Rx<SpaceshipPosition> _position = SpaceshipPosition.center.obs;
  SpaceshipPosition get position => _position.value;
  set position(SpaceshipPosition value) => _position.value = value;

  double fromGroundPerc(double scrollOffset, double height) {
    double fromGroundPerc = ((scrollOffset) / (height * 5 - 1)).clamp(0, 1);
    fromGroundPerc = exp(1 - 1 / pow(fromGroundPerc, 2)).clamp(0, 1);
    return fromGroundPerc;
  }

  bool showFire(double fromGroundPerc) =>
      0 < fromGroundPerc && fromGroundPerc < 0.3;

  double bottom(double scrollOffset, double height) {
    return Constants.spaceshipBottom +
        scrollOffset +
        fromGroundPerc(scrollOffset, height) *
            (height * 0.3 - Constants.totalSpaceshipHeight / 2);
  }

  double left(double scrollOffset, double width, double height) {
    // print("${scrollOffset.toInt()} ${scrollOffset.toInt() % 1000 == 0}");
    // return scrollOffset.toInt() % 1000 == 0
    //     ? width / 2 - totalSpaceshipWidth / 2
    //     : width * 0.1;
    // final int screenNum = numScreen(scrollOffset, height);
    // final double perc = screenScrollPerca(scrollOffset, height);

    if (showFire(fromGroundPerc(scrollOffset, height))) {
      return width / 2 - Constants.totalSpaceshipWidth / 2;
    }
    return width / 2 - Constants.totalSpaceshipWidth / 2;
    // return (screenNum % 2 == 0 ? width * perc : width * (1 - perc)) -
    //     totalSpaceshipWidth / 2;
  }
}
