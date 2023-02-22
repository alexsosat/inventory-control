import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_control/app/modules/lote_list/controllers/lote_list_controller.dart';
import 'filter_dialog.dart';

import '../../../../../global/form/search_field.dart';

class LoteSearchSection extends StatelessWidget {
  final Color? storageColor;
  const LoteSearchSection({
    required this.storageColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SearchField(
              controller: TextEditingController(),
              label: "Buscador",
              onChanged: (value) =>
                  Get.find<LoteListController>().searchText(value),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () => Get.dialog(
              LoteFilterDialog(
                storageColor: storageColor,
              ),
            ),
            icon: const Icon(
              Icons.filter_alt_outlined,
            ),
          ),
        ],
      ),
    );
  }
}