import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-login-regis.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            'LoginView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
