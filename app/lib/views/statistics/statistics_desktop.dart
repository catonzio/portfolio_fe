import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';

class StatisticsDesktop extends StatelessWidget {
  final Section section;
  const StatisticsDesktop(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Dimensions.pageHeight(context);
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Hello"),
        Text("Hello"),
        Text("Hello"),
      ],
    );
  }
}
