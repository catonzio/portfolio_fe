import 'package:portfolio/config/configs.dart';

class Email {
  final String subject;
  final String senderEmail;
  final String senderName;
  final String body;

  Email(
      {required this.subject,
      required this.senderEmail,
      required this.senderName,
      required this.body});

  Map<String, dynamic> toJson() {
    return {
      "subject": subject,
      "sender_email": senderEmail,
      "sender_name": senderName,
      "body": body
    };
  }

  String getEmptyField() {
    if (senderName.isEmpty) {
      return "name";
    } else if (senderEmail.isEmpty) {
      return "email";
    } else if (subject.isEmpty) {
      return "subject";
    } else if (body.isEmpty) {
      return "body";
    } else {
      return "";
    }
  }

  bool isValidEmail() {
    return Configs.emailRegex.hasMatch(senderEmail) || senderEmail.isEmpty;
  }
}
