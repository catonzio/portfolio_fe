import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';

class ProjectsTablet extends StatelessWidget {
  final Section section;
  const ProjectsTablet(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Column(children: [
          Text("ProjectsTablet", style: TextStyle(fontSize: 50)),
        ]));
  }
}
