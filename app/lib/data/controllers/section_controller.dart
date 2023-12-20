import 'dart:ui';

import 'package:get/get.dart';

class SectionController extends GetxController {
  final int index;
  final int heightPerc;
  final String title;
  final Color bgColor;
  final String imagePath;

  SectionController(
      {required this.index,
      required this.heightPerc,
      required this.title,
      required this.bgColor,
      required this.imagePath});

  factory SectionController.fromMap(Map<String, dynamic> map) =>
      SectionController(
          index: map['index'],
          heightPerc: map['heightPerc'],
          title: map['title'],
          bgColor: map['bgColor'],
          imagePath: map['imagePath']);
}
