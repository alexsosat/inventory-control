import 'package:get/get.dart';

import '../controllers/tag_add_controller.dart';

class TagAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TagAddController>(
      () => TagAddController(),
    );
  }
}
