import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';
import 'package:portfolio/views/contact/contact_desktop.dart';
import 'package:portfolio/views/contact/contact_mobile.dart';
import 'package:portfolio/views/contact/contact_tablet.dart';
import 'package:portfolio/views/responsive.dart';

class ContactPage extends StatelessWidget {
  // final String title;
  final Section section;
  const ContactPage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    // SectionController section = Get.find<SectionController>(tag: title);

    return Responsive(
      mobile: ContactMobile(section),
      desktop: ContactDesktop(section),
      tablet: ContactTablet(section),
    );
  }
}
