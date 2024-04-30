import 'package:get/get.dart';
import 'package:mini_project_10/app/modules/home/controllers/home_controller.dart';
import 'package:mini_project_10/app/modules/login/controllers/login_controller.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.put(LoginController());
    Get.put(HomeController());
  }
}
