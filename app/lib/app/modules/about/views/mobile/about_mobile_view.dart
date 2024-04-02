import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/about/controllers/about_controller.dart';
import 'package:portfolio/app/modules/about/views/mobile/subviews/about_overview_mobile.dart';
import 'package:portfolio/app/modules/about/views/mobile/subviews/work_experience_view_mobile.dart';

class AboutMobileView extends StatelessWidget {
  const AboutMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final AboutController controller = AboutController.to;
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: const Column(
        children: [
          AboutOverviewMobile(),
          WorkExperienceViewMobile(),
        ],
      ),
    );}
}
