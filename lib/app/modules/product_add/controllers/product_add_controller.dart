import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddController extends GetxController {
  final formKey = GlobalKey<FormState>(debugLabel: '_AddStorageFormState');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

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
