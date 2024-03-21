import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:portfolio/app//shared/ui/mypage.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return MyPage(
        body: Container(
            color: Colors.red[200],
            child: const Center(child: Text('This is the home page'))),
        isScrollEnabled: (_) => true);
  }
}
