import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:inventory_control/app/data/models/storages/storage.dart';
import 'package:inventory_control/global/overlays/dialog/dialog.dart';
import 'package:inventory_control/global/overlays/loading_dialog.dart';
import 'package:inventory_control/services/local_database/call_function.dart';

import '../../../data/providers/storage_provider.dart';

class StorageAddController extends GetxController {
  final StorageProvider _provider = StorageProvider();

  final formKey = GlobalKey<FormState>(debugLabel: '_AddStorageFormState');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Color color = Colors.blueGrey;

  Future saveStorage() async {
    baseActionCall(
      loadingText: 'Registrando Bodega...',
      call: () => _provider.addStorage(
        Storage(
          name: nameController.text,
          address: addressController.text,
          hexColor: colorToHex(color),
        ),
      ),
      onSuccess: (_) => openDialogWindow(
        title: "Se registro la bodega",
        type: DialogType.success,
        onConfirm: () => Get.back(),
      ),
    );
  }
}
