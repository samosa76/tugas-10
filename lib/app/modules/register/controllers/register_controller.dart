import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  //Register new account
  void registerAccount(
    String username,
    String email,
    String address,
    String number,
    String password,
    String confirmPassword,
  ) async {
    //Check if every text field is NOT NULL
    if (username.isEmpty ||
        email.isEmpty ||
        address.isEmpty ||
        number.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar('Missing Data', 'Silahkan lengkapi data anda');
    }
    //Check email validation
    else if (!_isValidEmail(email)) {
      Get.snackbar('Invalid Email', 'Masukan email dengan benar');
    } else {
      //If confirmation password match
      if (password == confirmPassword) {
        try {
          //add datetime
          String dateNow = DateTime.now().toString();

          //adding data to "user" collection and rename doc by email
          await firestore.collection('user').doc(email).set({
            'username': username,
            'email': email,
            'addres': address,
            'number': number,
            'password': password,
            'register-at': dateNow,
          });
          //create new user using email and password
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          Get.snackbar('Success', 'User telah di buat');
          Get.offAndToNamed(Routes.AUTH);
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

  //validation email
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

  //reset setiap text field
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

  //text sudah punya akun clicked
  void textLoginClicked() {
    Get.offNamed(Routes.AUTH);
  }
}
