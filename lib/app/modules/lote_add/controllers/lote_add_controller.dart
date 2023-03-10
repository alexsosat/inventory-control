import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:inventory_control/app/modules/lote_view/controllers/lote_view_controller.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../services/local_database/call_function.dart';
import '../../../data/models/lote/lote.dart';
import '../../../data/models/product/product.dart';
import '../../../data/models/product_presentation/product_presentation.dart';
import '../../../data/models/storages/storage.dart';
import '../../../data/providers/lote_provider.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/controllers/storage_list_controller.dart';
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

  LoteAddController();

  @override
  void onInit() {
    getInitialData();
    super.onInit();
  }

  getInitialData() async {
    final arguments = Get.arguments;
    if (arguments is Storage) {
      storage = arguments;
    } else if (arguments is Lote) {
      final lote = arguments;
      loteUIDController.text = lote.loteUID;
      quantityController.text = lote.quantity.toString();
      color = colorFromHex(lote.hexColor) ?? Colors.blueGrey;
      manufacturedDate = lote.dateManufacture;
      expirationDate = lote.dateExpiration;
      storage = lote.storage.value;
      product = lote.product.value;
      productPresentation = lote.productPresentation.value;
    }
  }

  saveLote() async {
    final Lote lote = Get.arguments is Lote
        ? Get.arguments as Lote
        : Lote(
            loteUID: loteUIDController.text.trim(),
            dateExpiration: expirationDate!,
            dateManufacture: manufacturedDate!,
            dateCreated: DateTime.now(),
            hexColor: colorToHex(color),
            quantity: double.parse(quantityController.text),
            status: getLoteStatus(expirationDate!),
          );

    lote.loteUID = loteUIDController.text.trim();
    lote.dateExpiration = expirationDate!;
    lote.dateManufacture = manufacturedDate!;
    lote.dateCreated = DateTime.now();
    lote.hexColor = colorToHex(color);
    lote.quantity = double.parse(quantityController.text);
    lote.status = getLoteStatus(expirationDate!);

    lote.storage.value = storage;
    lote.product.value = product;

    lote.productPresentation.value = productPresentation;

    baseActionCall(
      loadingText: 'Registrando Lote...',
      call: () => _provider.addLote(lote),
      onSuccess: (_) => openDialogWindow(
        title: "Se registr?? el lote",
        type: DialogType.success,
        onConfirm: () {
          Get.find<LoteListController>().loadLotes();
          Get.find<HomeController>().loadData();
          Get.find<StorageListController>().loadData();

          Get.back();

          if (Get.arguments is Lote) Get.back();
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
