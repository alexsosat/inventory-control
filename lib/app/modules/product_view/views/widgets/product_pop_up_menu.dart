import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_control/global/overlays/dialog/dialog.dart';

import '../../../../routes/app_pages.dart';
import '../../controllers/product_view_controller.dart';

class ProductPopUpMenu extends StatelessWidget {
  const ProductPopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => const [
        PopupMenuItem<int>(
          value: 0,
          child: Text("Editar Producto"),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Text("Eliminar Producto"),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 0:
            Get.toNamed(
              Routes.PRODUCT_ADD,
              arguments: Get.find<ProductViewController>().product,
            );
            break;
          case 1:
            openDialogWindow(
              title: "¿Deseas eliminar este producto?",
              message: "Esta acción no se puede deshacer",
              type: DialogType.warning,
              onConfirm: () =>
                  Get.find<ProductViewController>().deleteProduct(),
              onCancel: () {},
            );
            break;
        }
      },
    );
  }
}
