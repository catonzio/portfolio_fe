import 'package:flutter/material.dart';
import 'package:portfolio/controllers/section_controller.dart';

class ProjectsTablet extends StatelessWidget {
  final SectionController sectionController;
  const ProjectsTablet(this.sectionController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Column(children: [
          Text("ProjectsTablet", style: TextStyle(fontSize: 50)),
        ]));
  }
}
