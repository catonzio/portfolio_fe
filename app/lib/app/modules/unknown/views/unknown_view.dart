import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/shared/ui/mypage.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPage(
        body: Center(
          child: DefaultTextStyle(
            style: context.textTheme.displaySmall!,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'This page does not exist.',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Please check the URL.",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
        isScrollEnabled: (_) => false);
  }
}
