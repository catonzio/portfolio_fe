import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/config/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactsDescription extends StatelessWidget {
  const ContactsDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: context.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0, 32.0, 32.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: Constants.contactInfo
                .map((Map<String, dynamic> mapText) => ContactsDescriptionRow(
                      icon: mapText['icon']!,
                      text: mapText['text']!,
                    ))
                .toList()
                .animate(delay: 1000.ms, interval: 500.ms)
                .fade(duration: 500.ms)),
      ),
    );
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
        InkWell(onTap: launch, child: SelectableText(text))
      ],
    );
  }

  void launch() {
    if (text.contains("@")) {
      canLaunchUrlString("mailto:$text").then((value) {
        if (value) {
          launchUrlString("mailto:$text");
        }
      });
    } else if (text.contains("+39")) {
      canLaunchUrlString("tel:$text").then((value) {
        if (value) {
          launchUrlString("tel:$text");
        }
      });
    } else if (text.contains("Italy")) {
      canLaunchUrlString("https://goo.gl/maps/7Q4Qg3QJ9zQ2").then((value) {
        if (value) {
          launchUrlString("https://goo.gl/maps/7Q4Qg3QJ9zQ2");
        }
      });
    }
  }
}
