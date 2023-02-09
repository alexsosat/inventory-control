import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/product/product.dart';
import '../../../../../global/form/bottomsheets/metric_unit_bottomsheet.dart';

import '../../../../../global/card/rounded_form_card.dart';
import '../../../../../global/form/pickers/color_picker.dart';
import '../../../../../global/form/text_form_field_rounded.dart';
import '../../controllers/product_add_controller.dart';

class ProductAddForm extends StatefulWidget {
  const ProductAddForm({super.key});

  @override
  State<ProductAddForm> createState() => _ProductAddFormState();
}

class _ProductAddFormState extends State<ProductAddForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: Get.find<ProductAddController>().formKey,
      child: Column(
        children: [
          TextFormFieldRounded(
            controller: Get.find<ProductAddController>().nameController,
            labelText: 'Nombre',
          ),
          const SizedBox(height: 20),
          MetricUnitBottomSheet(
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          TextFormFieldRounded(
            controller: Get.find<ProductAddController>().descriptionController,
            isRequired: false,
            labelText: 'Descripción',
            maxLines: 5,
            inputType: TextInputType.multiline,
            inputAction: TextInputAction.newline,
          ),
          const SizedBox(height: 20),
          RoundedFormCard(
            children: [
              ColorPickerField(
                onColorChanged: (color) =>
                    Get.find<ProductAddController>().color = color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
