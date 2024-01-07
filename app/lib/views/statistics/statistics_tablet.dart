import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';

class StatisticsTablet extends StatelessWidget {
  final Section section;
  const StatisticsTablet(this.section, {super.key});

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
