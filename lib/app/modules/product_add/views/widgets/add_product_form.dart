import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/card/rounded_form_card.dart';
import '../../../../../global/form/pickers/color_picker.dart';
import '../../../../../global/form/pickers/tag_picker.dart';
import '../../../../../global/form/text_form_field_rounded.dart';
import '../../controllers/product_add_controller.dart';
import 'product_presentation_tile.dart';

class ProductAddForm extends StatefulWidget {
  const ProductAddForm({super.key});

  @override
  State<ProductAddForm> createState() => _ProductAddFormState();
}

class _ProductAddFormState extends State<ProductAddForm> {
  late ProductAddController controller;

  @override
  void initState() {
    controller = Get.find<ProductAddController>();
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
            labelText: 'Ingrediente activo',
            maxLines: 5,
            inputType: TextInputType.multiline,
            inputAction: TextInputAction.newline,
          ),
          const SizedBox(height: 20),
          RoundedFormCard(
            children: [
              ColorPickerField(
                initialColor: controller.color,
                onColorChanged: (color) => controller.color = color,
              ),
              const SizedBox(height: 10),
              ProductPresentationTile(
                initialPresentations: controller.presentations,
                onProductPresentationChanged: (presentations) =>
                    controller.presentations = presentations,
              ),
              const SizedBox(height: 10),
              TagPicker(
                selectedTags: controller.tags,
                onTagsChanged: (tags) => controller.tags = tags,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
