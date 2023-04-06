import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../utils/remove_focus.dart';
import '../controllers/product_add_controller.dart';
import 'widgets/add_product_form.dart';

class ProductAddView extends GetView<ProductAddController> {
  const ProductAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          !controller.isEditing ? 'Añadir Producto' : 'Editar Producto',
        ),
        centerTitle: false,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ProductAddForm(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          removeFocus(context);
          if (controller.formKey.currentState!.validate()) {
            openDialogWindow(
              title:
                  "¿Deseas registrar el producto ${controller.nameController.text}?",
              type: DialogType.info,
              onConfirm: () => controller.saveProduct(),
              onCancel: () {},
            );
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
