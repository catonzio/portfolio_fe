import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/config/constants.dart';

class ContactsDescriptionMobile extends StatelessWidget {
  const ContactsDescriptionMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: Constants.contactInfo
                .map((Map<String, dynamic> mapText) => ContactsDescriptionRow(
                      icon: mapText['icon']!,
                      text: mapText['text']!,
                    ))
                .toList()
                .animate(delay: 1000.ms, interval: 500.ms)
                .fade(duration: 500.ms))
        // const ProjectsRow()
        ;
  }
}

class ContactsDescriptionRow extends StatelessWidget {
  final Icon icon;
  final String text;

  const ContactsDescriptionRow(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
        Text(text)
      ],
    );
  }
}
