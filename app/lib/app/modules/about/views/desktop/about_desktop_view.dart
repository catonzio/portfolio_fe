import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/about/controllers/about_controller.dart';
import 'package:portfolio/app/modules/about/views/desktop/subviews/about_overview.dart';
import 'package:portfolio/app/modules/about/views/desktop/subviews/work_experience_view.dart';

class AboutDesktopView extends StatelessWidget {
  const AboutDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final AboutController controller = AboutController.to;
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: const Column(
        children: [
          AboutOverview(),
          WorkExperienceView(),
        ],
      ),
    );
  }
}
