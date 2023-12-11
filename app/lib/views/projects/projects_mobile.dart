
import 'package:flutter/material.dart';
import 'package:portfolio/controllers/section_controller.dart';

class ProjectsMobile extends StatelessWidget {
  final SectionController sectionController;
  const ProjectsMobile(this.sectionController, {super.key});

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
