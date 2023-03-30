import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../barcode_scanner/controllers/barcode_scanner_controller.dart';
import '../../../../../global/form/bottomsheets/product_presentation_bottomsheet.dart';
import '../../../../../global/form/pickers/date_picker.dart';

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
          Row(
            children: [
              Expanded(
                child: TextFormFieldRounded(
                  controller: controller.loteUIDController,
                  labelText: 'Número de registro del lote',
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () async {
                  final barcode =
                      await Get.find<BarcodeScannerController>().scanBarcode();

                  if (barcode == null) return;

                  controller.loteUIDController.text = barcode;
                },
                icon: const FaIcon(FontAwesomeIcons.barcode, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextFormFieldRounded(
            controller: controller.placeController,
            labelText: 'Lugar de almacenamiento',
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
                initialPresentation: controller.productPresentation,
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
                initialDate: controller.manufacturedDate,
                onDateChanged: (date) => controller.manufacturedDate = date,
              ),
              const SizedBox(height: 10),
              DatePicker(
                label: "Fecha de vencimiento",
                initialDate: controller.expirationDate,
                onDateChanged: (date) => controller.expirationDate = date,
              ),
              const SizedBox(height: 10),
              ColorPickerField(
                initialColor: controller.color,
                onColorChanged: (color) => controller.color = color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
