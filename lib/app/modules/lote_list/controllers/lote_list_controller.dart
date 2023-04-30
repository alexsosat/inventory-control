import 'package:get/get.dart';
import 'package:inventory_control/app/modules/home/controllers/storage_list_controller.dart';
import 'package:inventory_control/global/overlays/loading_dialog.dart';
import 'package:inventory_control/global/overlays/snackbar.dart';
import '../../../../global/overlays/dialog/dialog.dart';
import '../models/lote_list_search_model.dart';

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

  List<Lote> _lotes = [];

  LoteListSearchModel? searchModel;
  final searchText = ''.obs;

  @override
  void onInit() {
    loadLotes();
    super.onInit();
  }

  loadLotes() async {
    change(null, status: RxStatus.loading());
    try {
      if (storage != null) {
        _lotes = await _storageProvider.getStorageLotes(storage!.id);
      } else if (loteStatus != null) {
        _lotes = await _loteProvider.getLotesByStatus(loteStatus!);
      }
      if (_lotes.isNotEmpty) {
        if (searchModel != null) _filterLotes();
        change(_lotes, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  deleteStorage() async {
    openLoadingDialog("Eliminando almacen");
    try {
      final storageLotes = await _storageProvider.getStorageLotes(storage!.id);

      if (storageLotes.isNotEmpty) {
        Get.back();
        openDialogWindow(
          title: "No se puede eliminar el almacen porque contiene lotes",
          message: "Transfiere los lotes a otro almacen antes de eliminarlo",
          type: DialogType.error,
          onConfirm: () {},
        );
        return;
      }

      await _storageProvider.deleteStorage(storage!.id);
      Get.back();

      openDialogWindow(
        title: "Almacen eliminado",
        message: "El almacen ha sido eliminado correctamente",
        type: DialogType.success,
        onConfirm: () {
          Get.find<StorageListController>().loadData();
          Get.back();
        },
      );
    } catch (e) {
      snackbarMessage(
        title: "Error",
        message: e.toString(),
      );
    }
  }

  _filterLotes() {
    if (searchModel!.loteStatus != null) _filterLotesByStatus();
    if (searchModel!.tags != null) _filterLotesByTags();
    if (searchModel!.dateOrder != 0) {
      _filterLotesByDate();
    }
  }

  _filterLotesByDate() {
    switch (searchModel!.dateOrder) {
      case 0:
        break;
      case 1:
        switch (searchModel!.dateAscDesc) {
          case 0:
            _lotes.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));
            break;
          case 1:
            _lotes.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
            break;
        }
        break;
      case 2:
        switch (searchModel!.dateAscDesc) {
          case 0:
            _lotes.sort((a, b) => a.dateExpiration.compareTo(b.dateExpiration));
            break;
          case 1:
            _lotes.sort((a, b) => b.dateExpiration.compareTo(a.dateExpiration));
            break;
        }
        break;
      case 3:
        switch (searchModel!.dateAscDesc) {
          case 0:
            _lotes
                .sort((a, b) => a.dateManufacture.compareTo(b.dateManufacture));
            break;

          case 1:
            _lotes
                .sort((a, b) => b.dateManufacture.compareTo(a.dateManufacture));
            break;
        }
        break;

      default:
    }
  }

  _filterLotesByStatus() {
    _lotes = _lotes
        .where((lote) => searchModel!.loteStatus!.contains(lote.status))
        .toList();
  }

  _filterLotesByTags() {
    final filteredLotes = _lotes.toList();

    for (Lote lote in _lotes) {
      final product = lote.product.value;
      if (product == null) {
        filteredLotes.remove(lote);
        continue;
      }
      if (product.tags.isNotEmpty) {
        if (searchModel!.tags!.any((tag) => product.tags.contains(tag))) {
          continue;
        } else {
          filteredLotes.remove(lote);
        }
      } else {
        filteredLotes.remove(lote);
      }
    }

    _lotes = filteredLotes;
  }
}
