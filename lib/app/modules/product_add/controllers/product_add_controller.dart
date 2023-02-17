import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../services/local_database/call_function.dart';
import '../../../data/models/product/product.dart';
import '../../../data/models/tag/tag.dart';
import '../../../data/providers/product_provider.dart';
import '../../home/controllers/home_controller.dart';

class ProductAddController extends GetxController {
  final ProductProvider _provider = ProductProvider();

  final formKey = GlobalKey<FormState>(debugLabel: '_AddProductFormState');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  MetricUnit metricUnit = MetricUnit.unidades;
  List<Tag> tags = [];
  Color color = Colors.blueGrey;

  saveProduct() {
    baseActionCall(
      loadingText: 'Registrando Producto...',
      call: () {
        final product = Product(
          name: nameController.text,
          description: descriptionController.text,
          metricUnit: metricUnit,
          hexColor: colorToHex(color),
        );

        for (Tag tag in tags) {
          product.tags.add(tag);
        }

        return _provider.addProduct(product);
      },
      onSuccess: (_) => openDialogWindow(
        title: "Se registro el producto",
        type: DialogType.success,
        onConfirm: () => {
          Get.find<HomeController>().loadData(),
          Get.back(),
        },
      ),
    );
  }
}
