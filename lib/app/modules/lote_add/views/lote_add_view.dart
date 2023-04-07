import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_control/app/modules/lote_add/views/widgets/lote_add_form.dart';
import 'package:inventory_control/global/overlays/dialog/dialog.dart';

import '../../../../global/overlays/snackbar.dart';
import '../../../data/models/lote/lote.dart';
import '../controllers/lote_add_controller.dart';

class LoteAddView extends GetView<LoteAddController> {
  const LoteAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          !controller.isEditing ? 'Añadir Lote' : 'Editar Lote',
        ),
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

            openDialogWindow(
              title:
                  "¿Deseas registrar el lote ${controller.loteUIDController.text}?",
              message: controller.isEditing
                  ? "Estos valores sobreescribiran el lote ${(Get.arguments as Lote).loteUID}"
                  : null,
              type: DialogType.info,
              onConfirm: () => controller.saveLote(),
              onCancel: () {},
            );
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
