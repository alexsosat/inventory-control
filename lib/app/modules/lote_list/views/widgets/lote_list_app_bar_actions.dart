import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_control/global/overlays/dialog/dialog.dart';

import '../../../../routes/app_pages.dart';
import '../../controllers/lote_list_controller.dart';

class LoteListPopUpMenu extends GetView<LoteListController> {
  const LoteListPopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => const [
        PopupMenuItem<int>(
          value: 0,
          child: Text("Ver Ubicación"),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Text("Editar Almacen"),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: Text("Eliminar Almacen"),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 0:
            Get.defaultDialog(
              title: "Ubicación del almacen",
              middleText: controller.storage!.address == null ||
                      controller.storage!.address!.isEmpty
                  ? "Sin dirección"
                  : controller.storage!.address!,
            );
            break;
          case 1:
            Get.toNamed(
              Routes.STORAGE_ADD,
              arguments: controller.storage,
            );
            break;
          case 2:
            openDialogWindow(
              title: "¿Deseas eliminar este almacén?",
              message: "Esta acción no se puede deshacer",
              type: DialogType.warning,
              onConfirm: () => controller.deleteStorage(),
              onCancel: () {},
            );
            break;
        }
      },
    );
  }
}
