import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_10/app/components/my_button.dart';
import 'package:mini_project_10/app/components/my_textfield.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Register Your Account",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
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
                        'Email',
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
                    controller: controller.emailController,
                    hintText: "Email here...",
                    obscureText: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        'Address',
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
                    controller: controller.addressController,
                    hintText: "Address here...",
                    obscureText: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        'Phone Number',
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
                    controller: controller.numberController,
                    hintText: "Phone Number here...",
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        'Confirm Password',
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
                    controller: controller.confirmPasswordController,
                    hintText: "Confirm Password here...",
                    obscureText: true,
                  ),
                  MyButton(
                    text: 'Register',
                    onTap: () {
                      controller.registerAccount(
                        controller.usernameController.text,
                        controller.emailController.text,
                        controller.addressController.text,
                        controller.numberController.text,
                        controller.passwordController.text,
                        controller.confirmPasswordController.text,
                      );
                    },
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
                            controller.textLoginClicked();
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
