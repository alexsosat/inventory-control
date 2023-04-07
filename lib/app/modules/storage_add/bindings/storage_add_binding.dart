import 'package:get/get.dart';

import '../../../data/models/storages/storage.dart';
import '../controllers/storage_add_controller.dart';

class StorageAddBinding extends Bindings {
  @override
  void dependencies() {
    final storage = Get.arguments as Storage?;

    Get.lazyPut<StorageAddController>(
      () => StorageAddController(storage),
    );
  }
}
