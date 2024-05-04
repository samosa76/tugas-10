import 'package:get/get.dart';

import '../controllers/add_image_controller.dart';

class AddImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddImageController>(
      () => AddImageController(),
    );
  }
}
