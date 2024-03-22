import 'package:flutter/material.dart';
import 'package:portfolio/app/shared/ui/mypage.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPage(
        body: const Center(
          child: Text('Page not found'),
        ),
        isScrollEnabled: (_) => false);
  }
}
