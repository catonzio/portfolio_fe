
import 'package:flutter/material.dart';
import 'package:portfolio/data/controllers/section_controller.dart';

class ContactMobile extends StatelessWidget {
  final SectionController sectionController;
  const ContactMobile(this.sectionController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    	color: Colors.red,
    	child: const Column(
    	children: [
    		Text("ContactMobile", style: TextStyle(fontSize: 50)),
    	])
    );
  }
}
