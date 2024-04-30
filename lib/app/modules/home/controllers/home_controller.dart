import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final user = FirebaseAuth.instance.currentUser!;

  String test = FirebaseAuth.instance.currentUser!.email!;
  String test2 = "noob@gmail.com";

  String username() {
    var username = test.substring(0, test2.indexOf('@'));
    return username;
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
