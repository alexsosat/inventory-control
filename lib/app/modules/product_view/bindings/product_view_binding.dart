import 'package:get/get.dart';

import '../../../data/models/product/product.dart';
import '../controllers/product_view_controller.dart';

class ProductViewBinding extends Bindings {
  @override
  void dependencies() {
    final Product product = Get.arguments as Product;
    Get.lazyPut<ProductViewController>(
      () => ProductViewController(product),
    );
  }
}
