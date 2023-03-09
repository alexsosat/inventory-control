import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_control/global/overlays/dialog/dialog.dart';

import '../../../../routes/app_pages.dart';
import '../../controllers/lote_view_controller.dart';

class LotePopUpMenu extends StatelessWidget {
  const LotePopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => const [
        PopupMenuItem<int>(
          value: 0,
          child: Text("Editar Lote"),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Text("Eliminar Lote"),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 0:
            Get.toNamed(
              Routes.LOTE_ADD,
              arguments: Get.find<LoteViewController>().lote,
            );
            break;
          case 1:
            openDialogWindow(
              title: "¿Deseas eliminar este lote?",
              message: "Esta acción no se puede deshacer",
              type: DialogType.warning,
              onConfirm: () => Get.find<LoteViewController>().deleteLote(),
              onCancel: () {},
            );
            break;
        }
      },
    );
  }
}
