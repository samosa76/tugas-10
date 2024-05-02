import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var user = FirebaseAuth.instance.currentUser!.email;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //get user profile
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile() async {
    return await FirebaseFirestore.instance.collection('user').doc(user).get();
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
}
