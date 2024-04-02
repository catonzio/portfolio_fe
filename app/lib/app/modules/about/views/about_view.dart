import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/app//shared/ui/mypage.dart';
import 'package:portfolio/app/modules/about/views/desktop/about_desktop_view.dart';
import 'package:portfolio/app/modules/about/views/mobile/about_mobile_view.dart';
import 'package:portfolio/app/shared/ui/responsive.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});
  @override
  Widget build(BuildContext context) {
    return MyPage(
        body: const Responsive(
          mobile: AboutMobileView(),
          desktop: AboutDesktopView(),
        ),
        isScrollEnabled: (Offset offset) =>
            AboutController.to.isScrollEnabled(offset));
  }
}
