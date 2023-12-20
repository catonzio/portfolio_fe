import 'package:flutter/material.dart';

class Section {
  final int index;
  final String title;
  final double heightPerc;
  final double heightConfPerc;
  final Color bgColor;
  final String imagePath;
  final Function(String) page;

  const Section({
    required this.index,
    required this.title,
    required this.heightPerc,
    required this.heightConfPerc,
    required this.bgColor,
    required this.imagePath,
    required this.page,
  });
}
