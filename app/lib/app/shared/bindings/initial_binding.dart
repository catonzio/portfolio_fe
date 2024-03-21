import 'package:app/app/shared/controllers/pages_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PagesController(), permanent: true);
  }
}
