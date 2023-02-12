import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product/product.dart';

class ProductAddController extends GetxController {
  final formKey = GlobalKey<FormState>(debugLabel: '_AddProductFormState');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  MetricUnit metricUnit = MetricUnit.unidades;
  Color color = Colors.blueGrey;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
