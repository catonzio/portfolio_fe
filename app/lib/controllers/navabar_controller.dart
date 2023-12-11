import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/controllers/navbar_button_controller.dart';

class NavbarBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NavbarController());
    for (String section in Configs.sectionsInfo.keys) {
      Get.put(NavbarButtonController(section), tag: section);
    }
  }
}

class NavbarController extends GetxController {}
