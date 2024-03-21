import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trial2Controller extends GetxController {
  static Trial2Controller get to => Get.find<Trial2Controller>();

  final RxDouble _lastOffset = 0.0.obs;
  double get lastOffset => _lastOffset.value;
  set lastOffset(double value) => _lastOffset.value = value;

  final ScrollController scrollController = ScrollController(
    debugLabel: "page2",
    onAttach: (position) => print("SCROLL ATTACHED: ${position.debugLabel}"),
    onDetach: (position) => print("SCROLL DETACHED: ${position.debugLabel}"),
  );

  @override
  void onReady() {
    super.onReady();
    scrollController.addListener(() {
      if (!scrollController.position.atEdge) {
        lastOffset = scrollController.offset;
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
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
