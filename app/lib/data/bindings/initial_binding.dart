import 'package:get/get.dart';
import 'package:portfolio/data/controllers/settings.dart';
import 'package:portfolio/data/providers/client_provider.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController(), permanent: true);
    Get.put(ClientProvider());
  }
}
