import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_10/app/data/flower.dart';

class HomeController extends GetxController {
  var user = FirebaseAuth.instance.currentUser!.email;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // var flower = Get.arguments as Flower;

  //get user profile
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile() async {
    return await FirebaseFirestore.instance.collection('user').doc(user).get();
  }

  Stream<List<Flower>> getFlower() {
    return FirebaseFirestore.instance
        .collection('Flower')
        .orderBy("created_at")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Flower.fromJson(doc.data())).toList());
  }

  //Sgin User Out
  Future<void> signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> deleteFlower(String id) async {
    Get.dialog(
      AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Are you sure?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              final ref =
                  FirebaseFirestore.instance.collection("Flower").doc(id);
              ref.delete();
              Get.back();
              Get.snackbar('Deleted', 'Your data has been remove');
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Map sendingParameter(String id, String name, String image) {
    final data = {
      'id': id,
      'name': name,
      'image': image,
    };
    return data;
  }
}
