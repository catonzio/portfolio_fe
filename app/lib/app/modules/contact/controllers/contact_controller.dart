import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  static ContactController get to => Get.find<ContactController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHovering = false;

  late final Map<String, String? Function(String?)> validators;
  final Map<String, String> fieldsText = {
    "Name": "",
    "Email": "",
    "Subject": "",
    "Message": "",
  };

  @override
  void onInit() {
    validators = {
      "Name": nameValidator,
      "Email": emailValidator,
      "Message": messageValidator,
    };
    super.onInit();
  }

  bool isScrollEnabled(Offset offset) {
    return !isHovering;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    return null;
  }

  String? messageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Message is required";
    }
    return null;
  }

  void sendEmail() {
    // Validate returns true if the form is valid, or false otherwise.
    if (formKey.currentState!.validate()) {
      print("Valid form");
    }
  }

  void setText(String key, String value) {
    fieldsText[key] = value;
  }
}
