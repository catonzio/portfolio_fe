import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/pages.dart';

class Trial2Controller extends GetxController {
  static Trial2Controller get to => Get.find<Trial2Controller>();

  // final RxBool _isScrollEnabled = true.obs;
  // bool get isScrollEnabled => _isScrollEnabled.value;
  // set isScrollEnabled(bool value) => _isScrollEnabled.value = value;
  final RxDouble _lastOffset = 0.0.obs;
  double get lastOffset => _lastOffset.value;
  set lastOffset(double value) => _lastOffset.value = value;

  final ScrollController scrollController = ScrollController(
    debugLabel: "page2",
    keepScrollOffset: true,
    onAttach: (position) => print("SCROLL ATTACHED: $position"),
    onDetach: (position) => print("SCROLL DETACHED: $position"),
  );

  @override
  void onInit() {
    scrollController.addListener(() {
      if (!scrollController.position.atEdge) {
        lastOffset = scrollController.offset;
      }
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
}

class PagesController extends GetxController {
  static PagesController get to => Get.find<PagesController>();

  int currentIndex = -1;
  final RxBool _isAnimating = false.obs;
  bool get isAnimating => _isAnimating.value;
  set isAnimating(bool value) => _isAnimating.value = value;

  final RxList<bool> isHovering = List.generate(Pages.pages.length, (index) => false).obs;

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
      if (movement.dy > 10) {
        newIndex += 1;
      } else if (movement.dy < -10) {
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

  // void onScrollEvent(Offset scrollDelta, Function(int, int) changePage) {
  //   int newIndex;

  //   if (scrollDelta.dy > 0) {
  //     newIndex = currentIndex + 1;
  //   } else {
  //     newIndex = currentIndex - 1;
  //   }
  //   changePage(currentIndex, newIndex);
  // }

  // void onVerticalDragEnd(DragEndDetails details, Function(int, int) changePage) {
  //   int newIndex;

  //   if (details.velocity.pixelsPerSecond.dy < 0) {
  //     newIndex = currentIndex + 1;
  //   } else {
  //     newIndex = currentIndex - 1;
  //   }
  //   changePage(currentIndex, newIndex);
  // }
}
