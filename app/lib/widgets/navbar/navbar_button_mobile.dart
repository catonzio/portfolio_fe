import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/data/controllers/home_controller.dart';
import 'package:portfolio/data/controllers/navbar_button_controller.dart';
import 'dart:math' as math;

import 'package:portfolio/widgets/navbar/navbar_button_desktop.dart';

class NavbarButtonMobile extends StatelessWidget {
  final String text;
  final IconData icon;

  const NavbarButtonMobile(this.text, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarButtonController controller = Get.find(tag: text);
    return GestureDetector(
      onTap: () => controller.scrollToSection(context),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Obx(() => HoveredContainer(
                isHovered: controller.isHovering ||
                    Get.find<HomeController>().currentSection == text,
                child: Container(
                    width: math.min(context.widthP(10), 100),
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Icon(icon)),
              ))),
    );
  }
}
