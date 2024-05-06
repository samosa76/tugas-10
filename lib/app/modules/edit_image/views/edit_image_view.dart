import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project_10/app/components/my_button.dart';
import 'package:mini_project_10/app/components/my_textfield.dart';

import '../controllers/edit_image_controller.dart';

class EditImageView extends GetView<EditImageController> {
  const EditImageView({Key? key}) : super(key: key);
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
                                    child: Image.file(
                                      File(controller.image.value.path),
                                      height: 200,
                                      width: 300,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () async {
                                      await controller.getImage(true);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: controller.path,
                                        height: 200,
                                        width: 300,
                                        fit: BoxFit.fill,
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
                          "Flower Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      MyTextField(
                        controller: controller.flowerNameController,
                        hintText: 'Flower Name here..',
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
                      //check image changed
                      if (controller.image.value.path.isEmpty) {
                        controller.noImageUpdate(
                          controller.id,
                          controller.flowerNameController.text,
                          controller.path,
                        );
                      } else {
                        controller.updateFlower(
                          controller.id,
                          controller.flowerNameController.text,
                          File(
                            controller.image.value.path,
                          ),
                        );
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
