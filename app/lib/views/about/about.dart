import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/controllers/section_controller.dart';
import 'package:portfolio/views/about/about_desktop.dart';
import 'package:portfolio/views/about/about_mobile.dart';
import 'package:portfolio/views/about/about_tablet.dart';
import 'package:portfolio/views/responsive.dart';

class AboutPage extends StatelessWidget {
  final String title;
  const AboutPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SectionController controller = Get.find<SectionController>(tag: title);

    return Responsive(
      mobile: AboutMobile(controller),
      desktop: AboutDesktop(controller),
      tablet: AboutTablet(controller),
    );
  }
}
