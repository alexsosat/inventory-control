import 'package:get/get.dart';

import '../controllers/product_presentation_list_controller.dart';

class ProductPresentationListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductPresentationListController>(
      () => ProductPresentationListController(),
    );
  }
}
