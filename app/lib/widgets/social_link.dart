import 'package:flutter/material.dart';
import 'dart:html' as html;

class SocialLink extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String iconUrl;
  final String url;

  const SocialLink({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.iconUrl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 16),
      child: GestureDetector(
        onTap: () => html.window.open(url, 'new tab'),
        child: SizedBox(
          width: width,
          height: height,
          child: Image.asset(iconUrl, fit: BoxFit.fitWidth),
        ),
      ),
    );
  }
}
