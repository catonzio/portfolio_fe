import 'package:flutter/material.dart';
import 'package:portfolio/controllers/section_controller.dart';

class ContactTablet extends StatelessWidget {
  final SectionController sectionController;
  const ContactTablet(this.sectionController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Column(children: [
          Text("ContactTablet", style: TextStyle(fontSize: 50)),
        ]));
  }
}
