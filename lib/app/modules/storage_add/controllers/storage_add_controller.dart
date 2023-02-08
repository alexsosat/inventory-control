import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../services/local_database/call_function.dart';
import '../../../data/models/storages/storage.dart';
import '../../../data/providers/storage_provider.dart';
import '../../home/controllers/storage_list_controller.dart';

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
        onConfirm: () => {
          Get.find<StorageListController>().loadData(),
          Get.back(),
        },
      ),
    );
  }
}
