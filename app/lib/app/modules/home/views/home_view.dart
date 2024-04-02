import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/app//shared/ui/mypage.dart';
import 'package:portfolio/app/modules/home/views/desktop/home_desktop_view.dart';
import 'package:portfolio/app/modules/home/views/mobile/home_mobile_view.dart';
import 'package:portfolio/app/shared/ui/responsive.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return MyPage(
        body: const Responsive(
          mobile: HomeMobileView(),
          desktop: HomeDesktopView(),
        ),
        isScrollEnabled: (_) => true);
  }
}
