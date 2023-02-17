import 'package:get/get.dart';

import '../../../data/models/storages/storage.dart';
import '../../tag_picker/controllers/tag_list_controller.dart';
import '../controllers/lote_list_controller.dart';

class LoteListBinding extends Bindings {
  @override
  void dependencies() {
    final arguments = Get.arguments as Map<String, dynamic>;

    Get.lazyPut<LoteListController>(
      () => LoteListController(
        pageTitle: arguments['title'] as String,
        storage: arguments['storage'] as Storage?,
      ),
    );

    Get.lazyPut<TagListController>(
      () => TagListController([]),
    );
  }
}
