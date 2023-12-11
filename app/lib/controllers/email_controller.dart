import 'package:dio/dio.dart' as dio;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/api_controller.dart';
import 'package:portfolio/models/email.dart';

class EmailController extends ApiController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  Future<bool> sendEmail() async {
    Email email = Email(
        senderName: nameController.text.trim(),
        senderEmail: emailController.text.trim(),
        subject: subjectController.text.trim(),
        body: bodyController.text.trim());

    if (!email.isValidEmail()) {
      Get.snackbar("Error", "The email has an invalid format");
      return false;
    }

    var emptyField = email.getEmptyField();
    if (emptyField.isNotEmpty) {
      Get.snackbar("Error", "The $emptyField field is empty");
      return false;
    }

    try {
      dio.Response response =
          await client.post("/email/send", data: email.toJson());
      if (response.statusCode == 200) {
        Get.snackbar("Success", "The email was sent successfully");
        return true;
      }
    } catch (e) {
      print(e);
    }
    Get.snackbar("Fail", "The email couldn't be sent");
    return false;
  }
}
