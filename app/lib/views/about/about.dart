import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';
import 'package:portfolio/views/about/about_desktop.dart';
import 'package:portfolio/views/about/about_mobile.dart';
import 'package:portfolio/views/about/about_tablet.dart';
import 'package:portfolio/views/responsive.dart';

class AboutPage extends StatelessWidget {
  final Section section;
  const AboutPage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    // SectionController controller = Get.find<SectionController>(tag: title);
    // Section section = Configs.sectionsInfo[title]!;

    return Responsive(
      mobile: AboutMobile(section),
      desktop: AboutDesktop(section),
      tablet: AboutTablet(section),
    );
  }
}
