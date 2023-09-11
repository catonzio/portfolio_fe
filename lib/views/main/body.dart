import 'package:dcatone/controllers/home_scroll_controller.dart';
import 'package:dcatone/info/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final HomeScrollController scrollController = Get.put(HomeScrollController());
  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController.scrollController,
      itemCount: BodyUtils.views.length,
      itemBuilder: (BuildContext context, int index) => BodyUtils.views[index],
    );
  }
}
