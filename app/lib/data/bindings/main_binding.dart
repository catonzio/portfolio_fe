import 'package:get/get.dart';
import 'package:portfolio/data/bindings/email_binding.dart';
import 'package:portfolio/data/bindings/navbar_binding.dart';
import 'package:portfolio/data/controllers/home_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    EmailBindings().dependencies();
    Get.put(HomeController(), permanent: true);
    NavbarBindings().dependencies();
  }
}
