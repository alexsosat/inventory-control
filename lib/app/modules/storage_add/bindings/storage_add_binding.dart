import 'package:get/get.dart';

import '../controllers/storage_add_controller.dart';

class StorageAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageAddController>(
      () => StorageAddController(),
    );
  }
}
