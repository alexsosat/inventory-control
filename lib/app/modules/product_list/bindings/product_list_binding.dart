import 'package:get/get.dart';

import '../../tag_list/controllers/tag_list_controller.dart';
import '../controllers/product_list_controller.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(
      () => ProductListController(),
    );
    Get.lazyPut<TagListController>(
      () => TagListController([]),
    );
  }
}
