import 'package:get/get.dart';

import '../controllers/product_presentation_add_controller.dart';

class ProductPresentationAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPresentationAddController>(
      () => ProductPresentationAddController(),
    );
  }
}
