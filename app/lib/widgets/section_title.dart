import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/context_extension.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final TextStyle baseStyle;
  final double bottomPadding;

  const SectionTitle({
    super.key,
    required this.title,
    required this.baseStyle,
    this.bottomPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.verPad(bottomPadding)),
      child: Column(
        children: [
          AutoSizeText(
            title,
            style: baseStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onInverseSurface),
            maxLines: 1,
          ),
          SizedBox(
            width: context.widthP(10),
            child: Divider(
              thickness: 10,
              color: context.colorScheme.inversePrimary,
            ),
          )
        ],
      ),
    );
  }
}
