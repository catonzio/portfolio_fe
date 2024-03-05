import 'package:get/get.dart';
import 'package:portfolio/data/controllers/scroller.dart';
import 'package:portfolio/data/controllers/spaceship_controller.dart';

class SpaceshipBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpaceshipController>(() => SpaceshipController());
    Get.lazyPut<Scroller>(() => Scroller());
  }
}
