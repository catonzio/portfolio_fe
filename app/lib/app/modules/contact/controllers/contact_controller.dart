import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/contact/email_model.dart';
import 'package:portfolio/app/modules/contact/providers/email_provider.dart';

class ContactController extends GetxController {
  static ContactController get to => Get.find<ContactController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHovering = false;

  final EmailProvider provider;

  ContactController({required this.provider});

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

  Future<String> sendEmail() async {
    if (formKey.currentState!.validate()) {
      Email email = Email(
        subject: fieldsText["Subject"] ?? "",
        senderName: fieldsText["Name"] ?? "",
        senderEmail: fieldsText["Email"] ?? "",
        body: fieldsText["Message"] ?? "",
      );
      Response<Map>? response = await provider.sendEmail(email);
      return response?.bodyString ?? "";
    } else {
      return "Validazione fallita";
    }
  }

  void setText(String key, String value) {
    fieldsText[key] = value;
  }
}
