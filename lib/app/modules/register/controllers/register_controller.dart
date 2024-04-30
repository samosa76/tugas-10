import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_10/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController numberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void registerAccount(
    String username,
    String email,
    String address,
    String number,
    String password,
    String confirmPassword,
  ) async {
    if (username.isEmpty ||
        email.isEmpty ||
        address.isEmpty ||
        number.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar('Missing Data', 'Silahkan lengkapi data anda');
    } else if (!_isValidEmail(email)) {
      Get.snackbar('Invalid Email', 'Masukan email dengan benar');
    } else {
      if (password == confirmPassword) {
        try {
          String dateNow = DateTime.now().toString();
          await firestore.collection('user').add({
            'username': username,
            'email': email,
            'addres': address,
            'number': number,
            'password': password,
            'register-at': dateNow,
          });
          Get.snackbar('Success', 'User telah di buat');
          usernameController.clear();
          emailController.clear();
          addressController.clear();
          numberController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
        } catch (e) {
          Get.snackbar("Error", e.toString());
        }
      } else {
        Get.snackbar('Wrong', 'Your Password didn\'t match');
      }
    }
  }

  bool _isValidEmail(String email) {
    // Regular expression pattern for email validation
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );
    return emailRegex.hasMatch(email);
  }

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    numberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    emailController.dispose();
    addressController.dispose();
    numberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void textLoginClicked() {
    Get.toNamed(Routes.LOGIN);
  }
}
