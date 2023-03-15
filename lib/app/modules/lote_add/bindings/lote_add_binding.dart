import 'package:get/get.dart';

import '../controllers/lote_add_controller.dart';

class LoteAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoteAddController>(
      () => LoteAddController(),
    );
  }
}
