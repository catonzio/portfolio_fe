import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/controllers/section_controller.dart';
import 'package:portfolio/views/statistics/statistics_desktop.dart';
import 'package:portfolio/views/statistics/statistics_mobile.dart';
import 'package:portfolio/views/statistics/statistics_tablet.dart';
import 'package:portfolio/views/responsive.dart';

class StatisticsPage extends StatelessWidget {
  final String title;
  const StatisticsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SectionController controller = Get.find<SectionController>(tag: title);

    return Responsive(
      mobile: StatisticsMobile(controller),
      tablet: StatisticsTablet(controller),
      desktop: StatisticsDesktop(controller),
    );
  }
}
