import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/section_controller.dart';
import 'package:portfolio/views/home/home_desktop.dart';
import 'package:portfolio/views/home/home_mobile.dart';
import 'package:portfolio/views/home/home_tablet.dart';
import 'package:portfolio/views/responsive.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SectionController controller = Get.find<SectionController>(tag: title);
    return Responsive(
      mobile: HomeMobile(controller),
      desktop: HomeDesktop(controller),
      tablet: HomeTablet(controller),
    );
  }
}
