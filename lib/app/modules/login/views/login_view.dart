import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_10/app/components/my_button.dart';
import 'package:mini_project_10/app/components/my_textfield.dart';
import 'package:mini_project_10/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo-login.png"),
                  SizedBox(
                    width: 300,
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Welcome To Azalea',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        'Username',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  MyTextField(
                    controller: controller.usernameController,
                    hintText: "Username here...",
                    obscureText: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        'Password',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  MyTextField(
                    controller: controller.passwordController,
                    hintText: "Password here...",
                    obscureText: true,
                  ),
                  MyButton(
                    onTap: () {
                      // controller.isValid = controller.validation();
                      // if (controller.isValid) {
                      //   Get.offAndToNamed(Routes.HOME);
                      // }
                      controller.signUserIn();
                    },
                    text: "Login",
                  ),
                  SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        Text(
                          'Already have an account ?',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            controller.signinTextClicked();
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
