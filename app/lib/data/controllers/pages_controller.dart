import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/pages.dart';

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

class PagesController extends GetxController {
  static PagesController get to => Get.find<PagesController>();

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  final RxBool _isAnimating = false.obs;
  bool get isAnimating => _isAnimating.value;
  set isAnimating(bool value) => _isAnimating.value = value;

  final RxList<bool> isHovering =
      List.generate(Pages.pages.length, (index) => false).obs;

  void changePage(int index) {
    currentIndex = index;
  }

  int onChange(dynamic movement) {
    if (isAnimating) {
      return currentIndex;
    }
    int newIndex = currentIndex;
    print(movement);
    if (movement is Offset) {
      // print(movement.dy);
      if (movement.dy > 80) {
        newIndex += 1;
      } else if (movement.dy < -80) {
        newIndex -= 1;
      }
    } else if (movement is DragEndDetails) {
      // print(movement.velocity.pixelsPerSecond.dy);
      if (movement.velocity.pixelsPerSecond.dy < -0) {
        newIndex += 1;
      } else if (movement.velocity.pixelsPerSecond.dy > 0) {
        newIndex -= 1;
      }
    }
    return newIndex.clamp(0, Pages.pages.length - 1);
  }
}
