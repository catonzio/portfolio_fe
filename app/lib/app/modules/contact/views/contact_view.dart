import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/app//shared/ui/mypage.dart';
import 'package:portfolio/app/modules/contact/views/contact_desktop_view.dart';
import 'package:portfolio/app/modules/contact/views/contact_mobile_view.dart';
import 'package:portfolio/app/shared/ui/responsive.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});
  @override
  Widget build(BuildContext context) {
    final ContactController controller = ContactController.to;
    return MyPage(
        body: const Responsive(
          mobile: ContactMobileView(),
          desktop: ContactDesktopView(),
        ),
        isScrollEnabled: (_) => controller.isScrollEnabled(_));
  }
}
