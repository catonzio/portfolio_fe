import 'package:app/app/shared/ui/mypage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});
  @override
  Widget build(BuildContext context) {
    return MyPage(
        body: Container(
            color: Colors.yellow[200],
            child: const Center(child: Text('This is the contact page'))),
        isScrollEnabled: (_) => true);
  }
}
