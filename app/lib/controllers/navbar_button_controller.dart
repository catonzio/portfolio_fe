import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/home_controller.dart';

class NavbarButtonController extends GetxController {
  final String tag;
  final RxBool _isHovering = false.obs;
  get isHovering => _isHovering.value;

  NavbarButtonController(this.tag);

  setIsHovering(value) => _isHovering.value = value;

  void scrollToSection(BuildContext context) {
    Get.find<HomeController>().scrollToSection(context, tag);
  }
}
