import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../utils/remove_focus.dart';
import '../controllers/tag_add_controller.dart';
import 'widgets/tag_add_form.dart';

class TagAddView extends GetView<TagAddController> {
  const TagAddView({Key? key}) : super(key: key);
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
          child: TagAddForm(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          removeFocus(context);
          if (controller.formKey.currentState!.validate()) {
            openDialogWindow(
              title:
                  "¿Deseas registrar la etiqueta ${controller.nameController.text}?",
              type: DialogType.info,
              onConfirm: () => controller.saveTag(),
              onCancel: () {},
            );
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
