import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/buttons/pill_button.dart';
import '../../../../../global/overlays/dialog/dialog.dart';
import '../../controllers/lote_view_controller.dart';
import '../../models/lote_trasspass_model.dart';
import 'lote_trasspass_dialog.dart';

class LoteBottomActions extends StatelessWidget {
  const LoteBottomActions({super.key});

  _loteTrasspassAction() async {
    final trasspassModel = await Get.dialog<TrasspassModel?>(
      const LoteTrasspassDialog(),
    );

    print(trasspassModel);

    if (trasspassModel == null) return;

    final controller = Get.find<LoteViewController>();

    if (trasspassModel.storage.id == controller.lote.storage.value!.id) {
      openDialogWindow(
        title: "Acción no permitida",
        message: "No puedes traspasar un lote a la misma bodega",
        type: DialogType.warning,
        onConfirm: () {},
      );
      return;
    }

    if (trasspassModel.quantity > controller.lote.quantity) {
      openDialogWindow(
        title: "Acción no permitida",
        message: "No puedes traspasar una cantidad mayor a la que tienes",
        type: DialogType.warning,
        onConfirm: () {},
      );
      return;
    }

    Get.find<LoteViewController>().trasspassLote(trasspassModel);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: PillButton(
              onPressed: () => _loteTrasspassAction(),
              color: Colors.blue,
              child: Row(
                children: const [
                  Icon(
                    Icons.fire_truck_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Traspaso de lote",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: PillButton(
              onPressed: () {},
              color: Colors.red,
              child: Row(
                children: const [
                  Icon(
                    Icons.inventory_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Restar cantidad",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
