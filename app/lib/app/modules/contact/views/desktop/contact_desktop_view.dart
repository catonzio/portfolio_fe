import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/contact/views/widgets/contacts_description.dart';
import 'package:portfolio/app/modules/contact/views/widgets/contacts_form.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/config/shared_animations.dart';
import 'package:portfolio/config/text_styles.dart';

class ContactDesktopView extends StatelessWidget {
  const ContactDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ...getBackgroundImage(context),
        DefaultTextStyle(
          style: context.theme.textTheme.titleLarge!
              .copyWith(color: context.theme.colorScheme.onSurfaceVariant),
          child: Center(
            child: SizedBox(
              width: min(context.width, 1250),
              child: Padding(
                padding: const EdgeInsets.all(64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Contact me", style: TextStyles.negativeSectionTitle)
                        .animate(
                          effects: GlobalAnimations.titleAppearence,
                        )
                        .animate(
                            effects: GlobalAnimations.titleShimmer,
                            onPlay: (controller) =>
                                controller.repeat(reverse: false)),
                    Text(Constants.contactInfoString.trim()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 5, child: ContactsDescription()),
                        Expanded(
                            flex: 5,
                            child: const ContactsForm()
                                .animate()
                                .fade(delay: 1000.ms, duration: 500.ms)
                                .moveX(begin: 300, end: 0, duration: 500.ms)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> getBackgroundImage(BuildContext context) {
    return [
      Image.asset(
        'assets/images/backgrounds/cinecitta.png',
        fit: BoxFit.cover,
        color: context.theme.colorScheme.surfaceVariant,
        colorBlendMode: BlendMode.color,
      ),
      Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.darkBackground,
            gradient: RadialGradient(
              radius: 0.9,
              center: const AlignmentDirectional(0.25, 0),
              colors: [
                AppColors.darkBackground.withOpacity(0.8),
                AppColors.darkBackground.withOpacity(0.9),
                AppColors.darkBackground.withOpacity(0.95),
                AppColors.darkBackground.withOpacity(1),
                AppColors.darkBackground.withOpacity(1)
              ],
              stops: const [0.25, 0.5, 0.75, 0.9, 1],
            ),
          ),
        ),
      )
    ];
  }
}
