import 'package:get/get.dart';

import '../../../data/models/lote/lote.dart';
import '../../../data/models/storages/storage.dart';
import '../../../data/providers/lote_provider.dart';
import '../../../data/providers/storage_provider.dart';

class LoteListController extends GetxController with StateMixin<List<Lote>> {
  final Storage? storage;
  final LoteStatus? loteStatus;
  final String pageTitle;

  LoteListController({
    required this.pageTitle,
    this.storage,
    this.loteStatus,
  });

  final StorageProvider _storageProvider = StorageProvider();
  final LoteProvider _loteProvider = LoteProvider();

  @override
  void onInit() {
    loadLotes();
    super.onInit();
  }

  loadLotes() async {
    change(null, status: RxStatus.loading());
    late List<Lote> lotes = [];
    try {
      if (storage != null) {
        lotes = await _storageProvider.getStorageLotes(storage!.id);
      } else if (loteStatus != null) {
        lotes = await _loteProvider.getLotesByStatus(loteStatus!);
      }
      if (lotes.isNotEmpty) {
        change(lotes, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
