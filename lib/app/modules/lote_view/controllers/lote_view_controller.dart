import 'package:get/get.dart';
import 'package:inventory_control/app/modules/home/controllers/home_controller.dart';
import 'package:inventory_control/app/modules/home/controllers/storage_list_controller.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../global/overlays/loading_dialog.dart';
import '../../../data/models/lote/lote.dart';
import '../../../data/providers/lote_provider.dart';
import '../../../data/providers/storage_provider.dart';
import '../../lote_list/controllers/lote_list_controller.dart';
import '../models/lote_trasspass_model.dart';

class LoteViewController extends GetxController {
  final Lote lote;

  final _provider = StorageProvider();
  final _loteProvider = LoteProvider();

  LoteViewController(this.lote);

  decreaseLoteQuantity(double quantity) async {
    openLoadingDialog("Disminuyendo cantidad...");

    lote.quantity -= quantity;

    if (lote.quantity <= 0) {
      await _loteProvider.deleteLote(lote);
    } else {
      await _loteProvider.updateLote(lote);
    }

    Get.back();

    openDialogWindow(
      title: "Cantidad disminuida",
      message: "La cantidad del lote se ha disminuido correctamente",
      type: DialogType.success,
      onConfirm: () {
        if (Get.isRegistered<LoteListController>()) {
          Get.find<LoteListController>().loadLotes();
        }
        Get.find<StorageListController>().loadData();
        Get.find<HomeController>().loadData();
        Get.back();
      },
    );
  }

  trasspassLote(TrasspassModel trasspassModel) async {
    openLoadingDialog("Traspasando lote...");

    Lote? loteOnOtherStorage = await _provider.searchLoteByUID(
      lote.loteUID,
      trasspassModel.storage.id,
    );

    if (loteOnOtherStorage != null) {
      loteOnOtherStorage.quantity += trasspassModel.quantity;

      await _loteProvider.updateLote(loteOnOtherStorage);
    } else {
      Lote newLote = lote.copyWith(
        quantity: trasspassModel.quantity,
      );

      newLote.storage.value = trasspassModel.storage;
      newLote.product.value = lote.product.value;
      newLote.productPresentation.value = lote.productPresentation.value;
      newLote.status = lote.status;

      await _loteProvider.addLote(
        newLote,
      );
    }

    lote.quantity -= trasspassModel.quantity;

    if (lote.quantity <= 0) {
      await _loteProvider.deleteLote(lote);
    } else {
      await _loteProvider.updateLote(lote);
    }

    Get.back();

    openDialogWindow(
      title: "Lote traspasado",
      message: "El lote se ha traspasado correctamente",
      type: DialogType.success,
      onConfirm: () {
        if (Get.isRegistered<LoteListController>()) {
          Get.find<LoteListController>().loadLotes();
        }
        Get.find<StorageListController>().loadData();
        Get.find<HomeController>().loadData();
        Get.back();
      },
    );
  }

  deleteLote() async {
    openLoadingDialog("Eliminando lote...");

    await _loteProvider.deleteLote(lote);

    Get.back();

    openDialogWindow(
      title: "Lote eliminado",
      message: "El lote se ha eliminado correctamente",
      type: DialogType.success,
      onConfirm: () {
        if (Get.isRegistered<LoteListController>()) {
          Get.find<LoteListController>().loadLotes();
        }
        Get.find<StorageListController>().loadData();
        Get.find<HomeController>().loadData();
        Get.back();
      },
    );
  }
}
