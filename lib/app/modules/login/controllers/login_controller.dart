import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_10/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void buttonLoginClicked() {
    Get.toNamed(Routes.HOME);
  }

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
}
