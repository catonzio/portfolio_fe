import 'package:flutter/material.dart';
import 'package:portfolio/data/controllers/section_controller.dart';

class AboutMobile extends StatelessWidget {
  final SectionController section;
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
