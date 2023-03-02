import 'package:get/get.dart';

import '../../../data/models/lote/lote.dart';
import '../controllers/lote_view_controller.dart';

class LoteViewBinding extends Bindings {
  @override
  void dependencies() {
    final lote = Get.arguments as Lote;
    Get.lazyPut<LoteViewController>(
      () => LoteViewController(lote),
    );
  }
}
