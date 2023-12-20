import 'package:flutter/material.dart';
import 'package:portfolio/data/models/section.dart';

class AboutTablet extends StatelessWidget {
  final Section section;
  const AboutTablet(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Column(children: [
          Text("AboutTablet", style: TextStyle(fontSize: 50)),
        ]));
  }
}
