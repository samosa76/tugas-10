import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mini_project_10/app/data/flower.dart';

class HomeController extends GetxController {
  var user = FirebaseAuth.instance.currentUser!.email;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //get user profile
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile() async {
    return await FirebaseFirestore.instance.collection('user').doc(user).get();
  }

  Stream<List<Flower>> getFlower() {
    return FirebaseFirestore.instance.collection('Flower').snapshots().map(
        (snapshot) =>
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
}
