import 'package:get/get.dart';

import '../../barcode_scanner/controllers/barcode_scanner_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/storage_list_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<StorageListController>(
      () => StorageListController(),
    );
    Get.lazyPut<BarcodeScannerController>(
      () => BarcodeScannerController(),
    );
  }
}
