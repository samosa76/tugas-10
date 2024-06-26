import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddImageController extends GetxController {
  final image = XFile("").obs;
  CollectionReference ref = FirebaseFirestore.instance.collection('Flower');

  late TextEditingController flowerNameController;

  @override
  void onInit() {
    super.onInit();
    flowerNameController = TextEditingController();
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

  Future<void> saveImage(File images, String name) async {
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
    if (name.isNotEmpty && images.path.isNotEmpty) {
      try {
        String imageUrl = await uploadFile(images);
        String dateNow = DateTime.now().toString();
        final refDoc = ref.doc();
        final data = {
          'id': refDoc.id,
          'name': name,
          'image': imageUrl,
          'created_at': dateNow,
        };
        refDoc.set(data);
        Get.back();
      } catch (e) {
        Get.snackbar('Fail', 'Somthing went wrong');
      }
      Get.back();
    } else {
      Get.back();
      Get.snackbar('Invalid', 'Please enter your data');
    }
  }

  //Image Picker
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
