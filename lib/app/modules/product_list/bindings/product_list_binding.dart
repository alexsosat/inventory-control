import 'package:get/get.dart';

import '../controllers/product_list_controller.dart';
import '../controllers/tag_filter_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(
      () => ProductListController(),
    );
    Get.lazyPut<TagFilterController>(
      () => TagFilterController([]),
    );
  }
}
