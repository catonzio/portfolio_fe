import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/data/controllers/home_controller.dart';

class NavbarController extends GetxController {
  final HomeController homeController = HomeController.to;
  final Map<String, RxBool> isHovering =
      Configs.sectionsInfo.map((key, value) => MapEntry(key, false.obs));

  setIsHovering(bool value, String section) =>
      isHovering[section]!.value = value;

  void scrollToSection(BuildContext? context, String section) {
    if (context == null) return;
    homeController.scrollToSection(context, section);
    // Scrollable.ensureVisible(context,
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.easeInOutCubic);
  }
}
