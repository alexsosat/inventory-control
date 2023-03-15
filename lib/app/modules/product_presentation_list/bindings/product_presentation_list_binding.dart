import 'package:get/get.dart';

import '../../../data/models/product_presentation/product_presentation.dart';
import '../controllers/product_presentation_list_controller.dart';

class ProductPresentationListBinding extends Bindings {
  @override
  void dependencies() {
    final presentations = Get.arguments as List<ProductPresentation>;
    Get.lazyPut<ProductPresentationListController>(
      () => ProductPresentationListController(presentations),
    );
  }
}
