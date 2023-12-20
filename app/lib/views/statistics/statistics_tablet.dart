
import 'package:flutter/material.dart';
import 'package:portfolio/data/controllers/section_controller.dart';

class StatisticsTablet extends StatelessWidget {
  final SectionController sectionController;
  const StatisticsTablet(this.sectionController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    	color: Colors.red,
    	child: const Column(
    	children: [
    		Text("ContactTablet", style: TextStyle(fontSize: 50)),
    	])
    );
  }
}
