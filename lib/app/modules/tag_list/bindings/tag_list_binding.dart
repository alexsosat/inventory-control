import 'package:get/get.dart';

import '../../../data/models/tag/tag.dart';
import '../controllers/tag_list_controller.dart';

class TagPickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TagListController>(
      () => TagListController(
        Get.arguments as List<Tag>,
      ),
    );
  }
}
