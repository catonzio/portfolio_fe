import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/section_controller.dart';
import 'package:portfolio/views/contact/contact_desktop.dart';
import 'package:portfolio/views/contact/contact_mobile.dart';
import 'package:portfolio/views/contact/contact_tablet.dart';
import 'package:portfolio/views/responsive.dart';

class ContactPage extends StatelessWidget {
  final String title;
  const ContactPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SectionController controller = Get.find<SectionController>(tag: title);

    return Responsive(
      mobile: ContactMobile(controller),
      desktop: ContactDesktop(controller),
      tablet: ContactTablet(controller),
    );
  }
}
