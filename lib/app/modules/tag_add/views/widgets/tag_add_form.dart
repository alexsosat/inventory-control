import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/card/rounded_form_card.dart';
import '../../../../../global/form/pickers/icon_picker.dart';
import '../../../../../global/form/text_form_field_rounded.dart';
import '../../controllers/tag_add_controller.dart';

class TagAddForm extends StatefulWidget {
  const TagAddForm({super.key});

  @override
  State<TagAddForm> createState() => _TagAddFormState();
}

class _TagAddFormState extends State<TagAddForm> {
  late TagAddController controller;

  @override
  void initState() {
    controller = Get.find<TagAddController>();
    super.initState();
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
            controller: controller.descriptionController,
            isRequired: false,
            labelText: 'Descripción',
            maxLines: 5,
            inputType: TextInputType.multiline,
            inputAction: TextInputAction.newline,
          ),
          const SizedBox(height: 20),
          RoundedFormCard(
            children: [
              IconPicker(
                initialIcon: Icons.tag,
                onIconPicked: (icon) => controller.icon = icon,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
