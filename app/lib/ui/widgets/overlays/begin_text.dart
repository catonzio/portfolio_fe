import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/utils.dart';
import 'package:portfolio/data/controllers/scroller.dart';

class BeginText extends StatelessWidget {
  const BeginText({super.key});

  @override
  Widget build(BuildContext context) {
    final Scroller scroller = Scroller.to;
    return Obx(() {
      final int screenNum = numScreen(scroller.scrollOffset, context.height);

      return Positioned(
        bottom: screenNum <= 1 ? scroller.scrollOffset : 0,
        left: 0,
        right: 0,
        height: context.height * 0.4,
        child: Opacity(
          opacity: screenNum <= 1
              ? 1 - screenScrollPerca(scroller.scrollOffset, context.height)
              : 0,
          child: BeginTextBody(animateUntilTop: scroller.animateUntilTop),
        ),
      );
    });
  }
}

class BeginTextBody extends StatelessWidget {
  final Function() animateUntilTop;

  const BeginTextBody({
    super.key,
    required this.animateUntilTop,
  });

  @override
  Widget build(BuildContext context) {
    final double width =
        Size(context.width * 0.1, context.height * 0.1).shortestSide;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AutoSizeText(
          "Welcome to my Portfolio",
          maxLines: 1,
          style: context.textTheme.displayMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        AutoSizeText(
          "Click here to begin the journey",
          maxLines: 1,
          style: context.textTheme.headlineMedium,
        ),
        InkWell(
          onTap: animateUntilTop,
          child: Container(
              width: width,
              height: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Text("Begin")),
        ),
        AutoSizeText(
          "Or scroll up manually",
          maxLines: 1,
          style: context.textTheme.bodySmall,
        )
      ],
    );
  }
}
