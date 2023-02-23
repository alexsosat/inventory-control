import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventory_control/global/form/bottomsheets/product_presentation_bottomsheet.dart';
import 'package:inventory_control/global/form/pickers/date_picker.dart';

import '../../../../../global/card/rounded_form_card.dart';
import '../../../../../global/form/bottomsheets/product_bottomsheet.dart';
import '../../../../../global/form/bottomsheets/storage_bottomsheet.dart';
import '../../../../../global/form/pickers/color_picker.dart';
import '../../../../../global/form/text_form_field_rounded.dart';
import '../../controllers/lote_add_controller.dart';

class LoteAddForm extends StatefulWidget {
  const LoteAddForm({super.key});

  @override
  State<LoteAddForm> createState() => _LoteAddFormState();
}

class _LoteAddFormState extends State<LoteAddForm> {
  late LoteAddController controller;

  @override
  void initState() {
    controller = Get.find<LoteAddController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormFieldRounded(
            controller: controller.loteUIDController,
            labelText: 'Número de registro del lote',
          ),
          const SizedBox(height: 20),
          StorageBottomSheet(
            initialItem: controller.storage,
            onChanged: (storage) => controller.storage = storage,
          ),
          const SizedBox(height: 20),
          ProductBottomSheet(
            initialItem: controller.product,
            onChanged: (product) {
              controller.product = product;
              controller.productId(product.id);
            },
          ),
          const SizedBox(height: 20),
          Obx(
            () {
              return ProductPresentationBottomSheet(
                productId: controller.productId.value,
                onChanged: (presentation) =>
                    controller.productPresentation = presentation,
              );
            },
          ),
          const SizedBox(height: 20),
          TextFormFieldRounded(
            controller: controller.quantityController,
            labelText: 'Cantidad',
            inputType: const TextInputType.numberWithOptions(decimal: true),
            formatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
            ],
          ),
          const SizedBox(height: 20),
          RoundedFormCard(
            children: [
              DatePicker(
                label: "Fecha de manufactura",
                onDateChanged: (date) => controller.manufacturedDate = date,
              ),
              const SizedBox(height: 10),
              DatePicker(
                label: "Fecha de vencimiento",
                onDateChanged: (date) => controller.expirationDate = date,
              ),
              const SizedBox(height: 10),
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
