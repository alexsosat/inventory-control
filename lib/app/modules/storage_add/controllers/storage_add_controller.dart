import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../services/local_database/call_function.dart';
import '../../../data/models/storages/storage.dart';
import '../../../data/providers/storage_provider.dart';
import '../../home/controllers/storage_list_controller.dart';

class StorageAddController extends GetxController {
  final Storage? storage;

  StorageAddController(this.storage);

  final StorageProvider _provider = StorageProvider();

  final formKey = GlobalKey<FormState>(debugLabel: '_AddStorageFormState');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Color color = Colors.blueGrey;

  get isEditing => storage != null;

  @override
  void onInit() {
    if (isEditing) {
      nameController.text = storage!.name;
      addressController.text = storage!.address ?? "";
      color = colorFromHex(storage!.hexColor) ?? Colors.blueGrey;
    }
    super.onInit();
  }

  Future saveStorage() async {
    late Storage addStorage;

    if (isEditing) {
      addStorage = storage!;
      addStorage.name = nameController.text;
      addStorage.address = addressController.text;
      addStorage.hexColor = colorToHex(color);
    } else {
      addStorage = Storage(
        name: nameController.text,
        address: addressController.text,
        hexColor: colorToHex(color),
      );
    }

    baseActionCall(
      loadingText: 'Registrando Bodega...',
      call: () => _provider.addStorage(addStorage),
      onSuccess: (_) => openDialogWindow(
        title: "Se registro la bodega",
        type: DialogType.success,
        onConfirm: () {
          Get.find<StorageListController>().loadData();
          Get.back();
          if (isEditing) Get.back();
        },
      ),
    );
  }
}
