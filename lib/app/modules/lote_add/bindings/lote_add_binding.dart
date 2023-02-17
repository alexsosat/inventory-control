import 'package:get/get.dart';

import '../../../data/models/storages/storage.dart';
import '../controllers/lote_add_controller.dart';

class LoteAddBinding extends Bindings {
  @override
  void dependencies() {
    final storage = Get.arguments as Storage?;
    Get.lazyPut<LoteAddController>(
      () => LoteAddController(
        storage,
      ),
    );
  }
}
