import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Serialization/iconDataSerialization.dart';
import 'package:get/get.dart';
import '../../../../global/overlays/dialog/dialog.dart';
import '../../../data/models/tag/tag.dart';
import '../../../data/providers/tag_provider.dart';

import '../../../../services/local_database/call_function.dart';
import '../../tag_picker/controllers/tag_picker_controller.dart';

class TagAddController extends GetxController {
  final TagProvider _provider = TagProvider();

  final formKey = GlobalKey<FormState>(debugLabel: '_AddTagFormState');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Map<String, dynamic>? icon;

  saveTag() {
    baseActionCall(
      loadingText: 'Registrando Etiqueta...',
      call: () => _provider.addTag(
        Tag(
          name: nameController.text,
          description: descriptionController.text,
          icon: icon == null ? null : json.encode(icon),
        ),
      ),
      onSuccess: (_) => openDialogWindow(
        title: "Se registro la etiqueta",
        type: DialogType.success,
        onConfirm: () => {
          Get.find<TagPickerController>().loadTags(),
          Get.back(),
        },
      ),
    );
  }
}
