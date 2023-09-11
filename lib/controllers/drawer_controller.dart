import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawerController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get key => scaffoldKey;
}
