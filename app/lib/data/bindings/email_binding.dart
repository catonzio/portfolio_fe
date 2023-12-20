import 'package:get/get.dart';
import 'package:portfolio/data/controllers/email_controller.dart';
import 'package:portfolio/data/providers/client_provider.dart';
import 'package:portfolio/data/providers/email_provider.dart';
import 'package:portfolio/data/repositories/email_repository.dart';

class EmailBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(EmailController(Get.put(
        EmailRepository(Get.put(EmailProvider(Get.find<ClientProvider>()))))));
  }
}
