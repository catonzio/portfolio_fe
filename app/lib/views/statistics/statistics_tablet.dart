
import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';

class StatisticsTablet extends StatelessWidget {
  final Section section;
  const StatisticsTablet(this.section, {super.key});

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
