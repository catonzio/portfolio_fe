import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/models/email.dart';
import 'package:portfolio/data/repositories/email_repository.dart';

class EmailController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  final EmailRepository emailRepository;

  EmailController(this.emailRepository);

  Future<void> sendEmail() async {
    Email email = Email(
        senderName: nameController.text.trim(),
        senderEmail: emailController.text.trim(),
        subject: subjectController.text.trim(),
        body: bodyController.text.trim());

    if (!email.isValidEmail()) {
      Get.snackbar("Error", "The email has an invalid format");
    }

    String emptyField = email.getEmptyField();
    if (emptyField.isNotEmpty) {
      Get.snackbar("Error", "The $emptyField field is empty");
    }

    bool success = await emailRepository.sendEmail(email);
    if (success) {
      Get.snackbar("Success", "The email was sent successfully");
    } else {
      Get.snackbar("Fail", "The email couldn't be sent");
    }
  }
}
