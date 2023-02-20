import 'package:get/get.dart';
import 'package:quads/controller/login_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
