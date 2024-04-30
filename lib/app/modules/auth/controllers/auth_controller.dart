import 'package:get/get.dart';
import 'package:mini_project_10/app/routes/app_pages.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loggedIn() {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
