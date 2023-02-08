import 'package:get/get.dart';

import '../../../data/models/storages/storage.dart';
import '../../../data/providers/storage_provider.dart';

class StorageListController extends GetxController
    with StateMixin<List<Storage>> {
  final StorageProvider _provider = StorageProvider();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    change(null, status: RxStatus.loading());
    try {
      List<Storage> storages = await _provider.getStorageList();
      if (storages.isNotEmpty) {
        change(storages, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
