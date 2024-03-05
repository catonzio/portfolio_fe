import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Scroller extends GetxController {
  static Scroller get to => Get.find<Scroller>();

  final ScrollController scrollController = ScrollController();

  final RxDouble _scrollOffset = 0.0.obs;
  double get scrollOffset => _scrollOffset.value;
  set scrollOffset(double value) => _scrollOffset.value = value;

  final RxDouble _totalScrollPerc = 0.0.obs;
  double get totalScrollPerc => _totalScrollPerc.value;
  set totalScrollPerc(double value) => _totalScrollPerc.value = value;

  @override
  void onReady() {
    final double maxExtent = scrollController.position.maxScrollExtent;
    scrollController.jumpTo(maxExtent);
    // scrollController.animateTo(maxExtent,
    //     duration: 3.seconds, curve: Curves.decelerate);
    scrollController.addListener(() {
      scrollOffset = maxExtent - scrollController.offset;
      totalScrollPerc = (scrollOffset / maxExtent).clamp(0, 1);
    });
    super.onReady();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void animateUntilTop({int seconds = 30}) {
    seconds = seconds - (seconds * totalScrollPerc).toInt();
    scrollController.animateTo(0,
        duration: Duration(seconds: seconds), curve: Curves.easeIn);
  }

  void returnBack({int seconds = 15}) {
    seconds = seconds - (seconds * (1 - totalScrollPerc)).toInt();
    final double maxExtent = scrollController.position.maxScrollExtent;
    scrollController.animateTo(maxExtent,
        duration: Duration(seconds: seconds), curve: Curves.easeOut);
  }
}
