import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';

class ContactTablet extends StatelessWidget {
  final Section section;
  const ContactTablet(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Column(children: [
          Text("ContactTablet", style: TextStyle(fontSize: 50)),
        ]));
  }
}
