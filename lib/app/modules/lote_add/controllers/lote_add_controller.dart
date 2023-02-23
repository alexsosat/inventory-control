import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:inventory_control/app/modules/home/controllers/storage_list_controller.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../services/local_database/call_function.dart';
import '../../../data/models/lote/lote.dart';
import '../../../data/models/product/product.dart';
import '../../../data/models/product_presentation/product_presentation.dart';
import '../../../data/models/storages/storage.dart';
import '../../../data/providers/lote_provider.dart';
import '../../home/controllers/home_controller.dart';
import '../../lote_list/controllers/lote_list_controller.dart';

class LoteAddController extends GetxController {
  final LoteProvider _provider = LoteProvider();

  final formKey = GlobalKey<FormState>(debugLabel: '_AddProductFormState');

  final TextEditingController loteUIDController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  Color color = Colors.blueGrey;
  DateTime? manufacturedDate;
  DateTime? expirationDate;
  Storage? storage;
  Product? product;
  ProductPresentation? productPresentation;

  final productId = 0.obs;

  LoteAddController(this.storage);

  saveLote() async {
    baseActionCall(
      loadingText: 'Registrando Lote...',
      call: () {
        final lote = Lote(
          loteUID: loteUIDController.text.trim(),
          dateExpiration: expirationDate!,
          dateManufacture: manufacturedDate!,
          dateCreated: DateTime.now(),
          hexColor: colorToHex(color),
          quantity: double.parse(quantityController.text),
          status: getLoteStatus(expirationDate!),
        );

        lote.storage.value = storage;
        lote.product.value = product;

        lote.productPresentation.value = productPresentation;

        return _provider.addLote(lote);
      },
      onSuccess: (_) => openDialogWindow(
        title: "Se registró el lote",
        type: DialogType.success,
        onConfirm: () {
          Get.find<LoteListController>().loadLotes();
          Get.find<HomeController>().loadData();
          Get.find<StorageListController>().loadData();
          Get.back();
        },
      ),
    );
  }

  LoteStatus getLoteStatus(DateTime expirationDate) {
    final now = DateTime.now();
    final difference = expirationDate.difference(now).inDays;

    if (difference < 0) return LoteStatus.expired;
    if (difference < 90) return LoteStatus.toExpire;

    return LoteStatus.good;
  }
}
