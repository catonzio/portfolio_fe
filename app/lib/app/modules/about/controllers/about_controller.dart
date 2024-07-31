import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutController extends GetxController {
  static AboutController get to => Get.find<AboutController>();

  final ScrollController scrollController =
      ScrollController(keepScrollOffset: true);

  @override
  void onInit() {
    scrollController.addListener(() {
      final off = scrollController.offset;
      print((off / scrollController.position.maxScrollExtent) * 100);
    });
    super.onInit();
  }

  bool isScrollEnabled(Offset offset) {
    if (offset.dy > 0 &&
        scrollController.offset == scrollController.position.maxScrollExtent) {
      return true;
    } else if (offset.dy < 0 &&
        scrollController.offset == scrollController.position.minScrollExtent) {
      return true;
    }
    return false;
  }
}
