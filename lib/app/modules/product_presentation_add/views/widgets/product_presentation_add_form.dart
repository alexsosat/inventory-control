import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/form/bottomsheets/measure_unit_bottomsheet.dart';
import '../../../../../global/form/text_form_field_rounded.dart';
import '../../controllers/product_presentation_add_controller.dart';

class ProductPresentationAddForm extends StatefulWidget {
  const ProductPresentationAddForm({super.key});

  @override
  State<ProductPresentationAddForm> createState() =>
      _ProductPresentationAddFormState();
}

class _ProductPresentationAddFormState
    extends State<ProductPresentationAddForm> {
  late ProductPresentationAddController controller;

  @override
  void initState() {
    controller = Get.find<ProductPresentationAddController>();
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
            labelText: 'Cantidad',
            inputType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
          const SizedBox(height: 20),
          MeasureUnitBottomSheet(
            onChanged: (measureUnit) => controller.measureUnit = measureUnit,
          ),
        ],
      ),
    );
  }
}
