import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_control/app/modules/lote_add/views/widgets/lote_add_form.dart';

import '../../../../global/overlays/snackbar.dart';
import '../controllers/lote_add_controller.dart';

class LoteAddView extends GetView<LoteAddController> {
  const LoteAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Lote'),
        centerTitle: false,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: LoteAddForm(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.formKey.currentState!.validate()) {
            if (!controller.product!.presentations
                .contains(controller.productPresentation!)) {
              snackbarMessage(
                title: "Error de entrada",
                message:
                    "La presentación seleccionada no pertenece al producto seleccionado",
              );
              return;
            }
            controller.saveLote();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
