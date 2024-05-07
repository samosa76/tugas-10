import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project_10/app/components/my_button.dart';
import 'package:mini_project_10/app/components/my_textfield.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg-home.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: 70,
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(224, 173, 245, 0.5),
                  ),
                  child: const Text(
                    "Add your most beautiful flower\n"
                    "but still your my flower!",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ).paddingSymmetric(horizontal: 20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            controller.image.value.path != ""
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: FileImage(
                                        File(controller.image.value.path),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () async {
                                      await controller.getImage(true);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                          controller.imagePath,
                                        ),
                                      ),
                                    ),
                                  ),
                            Obx(
                              () => Center(
                                child: controller.image.value.path != ""
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () async {
                                          controller.image.value = XFile("");
                                        },
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 300,
                        child: Text(
                          "Username",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      MyTextField(
                        controller: controller.usernameController,
                        hintText: 'Username here..',
                        obscureText: false,
                      ),
                      const SizedBox(height: 15.0),
                      const SizedBox(
                        width: 300,
                        child: Text(
                          "Address",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      MyTextField(
                        controller: controller.addressController,
                        hintText: "Address here ...",
                        obscureText: false,
                      ),
                      const SizedBox(height: 15.0),
                      const SizedBox(
                        width: 300,
                        child: Text(
                          "Number",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      MyTextField(
                        type: TextInputType.number,
                        controller: controller.numberController,
                        hintText: "Number here ...",
                        obscureText: false,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: MyButton(
                    text: 'Edit Flower',
                    onTap: () {
                      if (controller.usernameController.text.isEmpty ||
                          controller.addressController.text.isEmpty ||
                          controller.numberController.text.isEmpty) {
                        Get.snackbar("Fail", "Missing value");
                      } else {
                        if (controller.image.value.path.isEmpty) {
                          controller.noImageUpdateProfile(
                            controller.email,
                            controller.usernameController.text,
                            controller.addressController.text,
                            controller.numberController.text,
                            controller.imagePath,
                          );
                        } else {
                          controller.updateProfile(
                            controller.email,
                            controller.usernameController.text,
                            controller.addressController.text,
                            controller.numberController.text,
                            File(controller.image.value.path),
                          );
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
