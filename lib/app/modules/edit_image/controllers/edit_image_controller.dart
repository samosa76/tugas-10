import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditImageController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var image = XFile("").obs;
  final flowerNameController = TextEditingController();
  String id = Get.arguments['id'];
  String name = Get.arguments['name'];
  String path = Get.arguments['image'];

  @override
  void onInit() {
    super.onInit();
    flowerNameController.text = name;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<String> uploadFile(File image) async {
    final storageReference =
        FirebaseStorage.instance.ref().child('Flower/${image.path}');
    await storageReference.putFile(image);
    String returnURL = "";
    await storageReference.getDownloadURL().then(
      (fileURL) {
        returnURL = fileURL;
      },
    );
    return returnURL;
  }

  Future<void> updateFlower(
    String id,
    String flowerName,
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
      final refDoc = firestore.collection('Flower').doc(id);
      final data = {
        'name': flowerName,
        'image': imageUrl,
      };
      refDoc.update(data);
      Get.back();
    } catch (e) {
      Get.snackbar('Fail', 'Somthing went wrong');
    }
    Get.back();
  }

  Future<void> noImageUpdate(
    String id,
    String flowerName,
    String image,
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
      final refDoc = firestore.collection('Flower').doc(id);
      final data = {
        'name': flowerName,
        'image': image,
      };
      refDoc.update(data);
      Get.back();
    } catch (e) {
      Get.snackbar('Fail', 'Somthing went wrong');
    }
    Get.back();
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
}
