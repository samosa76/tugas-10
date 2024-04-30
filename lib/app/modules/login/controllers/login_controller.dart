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

  validation() {
    if (usernameController.text.isEmpty) {
      return isValid;
    } else {
      return !isValid;
    }
  }

  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for the email');
      } else if (e.code == "wrong-password") {
        print('Wrong password');
      }
    }
  }
}
