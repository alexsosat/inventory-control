import 'package:get/get.dart';

import '../../../data/models/product/product.dart';
import '../controllers/product_add_controller.dart';

class ProductAddBinding extends Bindings {
  @override
  void dependencies() {
    final product = Get.arguments as Product?;
    Get.lazyPut<ProductAddController>(
      () => ProductAddController(product),
    );
  }
}
