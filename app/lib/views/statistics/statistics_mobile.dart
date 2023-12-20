import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';

class StatisticsMobile extends StatelessWidget {
  final Section section;
  const StatisticsMobile(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Column(children: [
          Text("ContactMobile", style: TextStyle(fontSize: 50)),
        ]));
  }
}
