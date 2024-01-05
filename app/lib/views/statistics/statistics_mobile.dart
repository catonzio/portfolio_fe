import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';

class StatisticsMobile extends StatelessWidget {
  final Section section;
  const StatisticsMobile(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
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
