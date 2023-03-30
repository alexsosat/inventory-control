import 'package:get/get.dart';

import '../../barcode_scanner/controllers/barcode_scanner_controller.dart';
import '../controllers/lote_add_controller.dart';

class LoteAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoteAddController>(
      () => LoteAddController(),
    );
    Get.lazyPut<BarcodeScannerController>(
      () => BarcodeScannerController(),
    );
  }
}
