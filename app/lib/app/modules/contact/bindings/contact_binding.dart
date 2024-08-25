import 'package:get/get.dart';
import 'package:portfolio/app/modules/contact/providers/email_provider.dart';

import '../controllers/contact_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    EmailProvider provider = Get.put(EmailProvider());
    Get.put<ContactController>(
      ContactController(provider: provider),
      permanent: true,
    );
  }
}
