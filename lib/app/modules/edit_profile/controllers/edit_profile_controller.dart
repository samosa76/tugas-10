import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mini_project_10/app/routes/app_pages.dart';

class EditProfileController extends GetxController {
  CollectionReference reference = FirebaseFirestore.instance.collection("user");
  var image = XFile("").obs;

  //TextField Initiallization
  final usernameController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  //Get all arguments
  String email = Get.arguments['email'];
  String username = Get.arguments['username'];
  String imagePath = Get.arguments['image'];
  String address = Get.arguments['address'];
  String number = Get.arguments['number'];

  @override
  void onInit() {
    super.onInit();
    usernameController.text = username;
    numberController.text = number;
    addressController.text = address;
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getImage(bool gallery) async {
    //deklarasikan picker
    ImagePicker picker = ImagePicker();
    XFile? pickedFile;
    // Let user select photo from gallery
    if (gallery) {
      pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
    }
    // Otherwise open camera to get new photo
    else {
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );
    }
    //jika user memilih sebuah gambar maka pickedfile di assign kedalam image variable
    if (pickedFile != null) {
      image.value = pickedFile;
    }
  }

  Future<String> uploadFile(File image) async {
    final storageReference =
        FirebaseStorage.instance.ref().child('User/${image.path}');
    await storageReference.putFile(image);
    String returnURL = "";
    await storageReference.getDownloadURL().then(
      (fileURL) {
        returnURL = fileURL;
      },
    );
    return returnURL;
  }

  Future updateProfile(
    String email,
    String username,
    String address,
    String number,
    File images,
  ) async {
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
      String imageUrl = await uploadFile(images);
      final refDoc = reference.doc(email);
      final data = {
        'username': username,
        'addres': address,
        'number': number,
        'image-profile': imageUrl,
      };
      refDoc.update(data);
      Get.offAllNamed(Routes.AUTH);
      Get.snackbar('Success', 'Update success');
    } catch (e) {
      Get.snackbar('Fail', 'Invalid input');
    }
  }

  Future noImageUpdateProfile(
    String email,
    String username,
    String address,
    String number,
    String images,
  ) async {
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
      final refDoc = reference.doc(email);
      final data = {
        'username': username,
        'addres': address,
        'number': number,
        'image-profile': images,
      };
      refDoc.update(data);
      Get.offAllNamed(Routes.AUTH);
      Get.snackbar('Success', 'Update success');
    } catch (e) {
      Get.snackbar('Fail', 'Invalid input');
    }
  }
}
