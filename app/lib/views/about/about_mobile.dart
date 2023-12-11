import 'package:flutter/material.dart';
import 'package:portfolio/controllers/section_controller.dart';

class AboutMobile extends StatelessWidget {
  final SectionController sectionController;
  const AboutMobile(this.sectionController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Column(children: [
          Text("AboutMobile", style: TextStyle(fontSize: 50)),
        ]));
  }
}
