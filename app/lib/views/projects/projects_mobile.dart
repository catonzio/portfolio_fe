
import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';

class ProjectsMobile extends StatelessWidget {
  final Section section;
  const ProjectsMobile(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    	color: Colors.red,
    	child: const Column(
    	children: [
    		Text("ProjectsMobile", style: TextStyle(fontSize: 50)),
    	])
    );
  }
}
