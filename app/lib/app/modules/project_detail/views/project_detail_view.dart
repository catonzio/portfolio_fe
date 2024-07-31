import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/app/modules/project_detail/views/desktop/project_detail_desktop.dart';
import 'package:portfolio/app/modules/project_detail/views/mobile/project_detail_mobile.dart';
import 'package:portfolio/app/shared/ui/mypage.dart';
import 'package:portfolio/app/shared/ui/responsive.dart';

import '../controllers/project_detail_controller.dart';

class ProjectDetailView extends GetView<ProjectDetailController> {
  const ProjectDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPage(
        extendBodyBehindAppBar: false,
        hasBackButton: true,
        body: const Responsive(
          mobile: ProjectDetailMobile(),
          desktop: ProjectDetailDesktop(),
        ),
        isScrollEnabled: (_) => false);
  }
}
