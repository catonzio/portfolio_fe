import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:portfolio/config/context_extension.dart';

class SocialLink extends StatelessWidget {
  final String title;
  final String iconUrl;
  final String url;

  const SocialLink({
    super.key,
    required this.title,
    required this.iconUrl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return
        // Padding(
        //   padding: const EdgeInsets.only(right: 8),
        //   child: Container(
        //     width: Dimensions.width(context, perc: 3),
        //     height: Dimensions.width(context, perc: 3),
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: Themes.colorScheme(context).surface.withOpacity(0.5),
        //     ),
        //     child: InkWell(
        //       onTap: () => html.window.open(url, 'new tab'),
        //       child: Tooltip(
        //         padding: const EdgeInsets.all(8),
        //         message: title,
        //         child: ClipOval(
        //           child: Image.asset(
        //             iconUrl,
        //             fit: BoxFit.contain,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),

        Padding(
      padding: const EdgeInsets.only(right: 16, top: 16),
      child: GestureDetector(
        onTap: () => html.window.open(url, 'new tab'),
        child: Container(
          width: context.widthP(1.5),
          height: context.widthP(1.5),
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(iconUrl),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
