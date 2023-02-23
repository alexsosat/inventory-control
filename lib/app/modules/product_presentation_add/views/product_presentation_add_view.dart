import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../utils/remove_focus.dart';
import '../controllers/product_presentation_add_controller.dart';
import 'widgets/product_presentation_add_form.dart';

class ProductPresentationAddView
    extends GetView<ProductPresentationAddController> {
  const ProductPresentationAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear etiqueta'),
        centerTitle: false,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ProductPresentationAddForm(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          removeFocus(context);
          if (controller.formKey.currentState!.validate()) {
            openDialogWindow(
              title:
                  "¿Deseas registrar la presentación ${controller.nameController.text}?",
              type: DialogType.info,
              onConfirm: () => controller.savePresentation(),
              onCancel: () {},
            );
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
