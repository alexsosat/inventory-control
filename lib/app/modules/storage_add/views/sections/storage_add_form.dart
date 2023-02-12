import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/card/rounded_form_card.dart';
import '../../../../../global/form/pickers/color_picker.dart';
import '../../../../../global/form/text_form_field_rounded.dart';
import '../../controllers/storage_add_controller.dart';

class StorageAddForm extends StatefulWidget {
  const StorageAddForm({super.key});

  @override
  State<StorageAddForm> createState() => _StorageAddFormState();
}

class _StorageAddFormState extends State<StorageAddForm> {
  late StorageAddController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<StorageAddController>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormFieldRounded(
            controller: controller.nameController,
            labelText: 'Nombre',
          ),
          const SizedBox(height: 20),
          TextFormFieldRounded(
            controller: controller.addressController,
            isRequired: false,
            labelText: 'Dirección',
            maxLines: 5,
            inputType: TextInputType.multiline,
            inputAction: TextInputAction.newline,
          ),
          const SizedBox(height: 20),
          RoundedFormCard(
            children: [
              ColorPickerField(
                onColorChanged: (color) => controller.color = color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
