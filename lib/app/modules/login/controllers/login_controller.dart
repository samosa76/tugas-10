import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_10/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isValid = false;

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

  void signinTextClicked() {
    Get.toNamed(Routes.REGISTER);
  }

  void signUserIn() async {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color.fromRGBO(213, 103, 205, 1),
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'channel-error') {
        Get.snackbar('Invalid Empty', 'Please fill your data');
      } else if (e.code == "invalid-email") {
        Get.snackbar('Invalid Email', 'Please enter a valid email address');
      } else if (e.code == "invalid-credential") {
        Get.snackbar('Wrong Input', 'wrong username & password');
      }
    }

    Navigator.pop(Get.context!);
  }
}
