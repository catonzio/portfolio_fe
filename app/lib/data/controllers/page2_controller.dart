import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2Controller extends GetxController {
  final ScrollController scrollController =
      ScrollController(keepScrollOffset: true);
  final PageStorageKey storageKey = const PageStorageKey('page2');

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  bool onScrollNotification(ScrollNotification scrollNotification,
      Function() onReachTop, Function() onReachBottom) {
    if (scrollNotification is ScrollEndNotification &&
        scrollNotification.metrics.pixels ==
            scrollNotification.metrics.minScrollExtent) {
      // User reached the top of the list, navigate to the previous page
      onReachTop();
    } else if (scrollNotification is ScrollEndNotification &&
        scrollNotification.metrics.pixels ==
            scrollNotification.metrics.maxScrollExtent) {
      // User reached the bottom of the list, navigate to the next page
      onReachBottom();
    }
    return true;
  }
}
