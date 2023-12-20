import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';

class AboutMobile extends StatelessWidget {
  final Section section;
  const AboutMobile(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Column(children: [
          Text("AboutMobile", style: TextStyle(fontSize: 50)),
        ]));
  }
}
