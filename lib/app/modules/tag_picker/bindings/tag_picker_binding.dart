import 'package:get/get.dart';

import '../../../data/models/tag/tag.dart';
import '../controllers/tag_picker_controller.dart';

class TagPickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TagPickerController>(
      () => TagPickerController(
        Get.arguments as List<Tag>,
      ),
    );
  }
}
