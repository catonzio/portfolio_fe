import 'package:flutter/material.dart';
import 'package:portfolio/controllers/section_controller.dart';

class AboutTablet extends StatelessWidget {
  final SectionController sectionController;
  const AboutTablet(this.sectionController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Column(children: [
          Text("AboutTablet", style: TextStyle(fontSize: 50)),
        ]));
  }
}
