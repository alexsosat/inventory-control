import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/buttons/group_buttons/lote_state_buttons.dart';
import '../../../../../global/buttons/group_buttons/tag_buttons.dart';
import '../../../../../global/form/dropdowns/date_asc_desc_dropdown.dart';
import '../../../../../global/form/dropdowns/lote_date_order_dropdown.dart';
import '../../../../../utils/color.dart';
import '../../../tag_picker/controllers/tag_list_controller.dart';
import '../../controllers/lote_list_controller.dart';
import '../../controllers/lote_search_controller.dart';
import '../../models/lote_list_search_model.dart';

class LoteFilterDialog extends StatefulWidget {
  final Color? storageColor;
  const LoteFilterDialog({
    this.storageColor,
    super.key,
  });

  @override
  State<LoteFilterDialog> createState() => _LoteFilterDialogState();
}

class _LoteFilterDialogState extends State<LoteFilterDialog> {
  late LoteSearchController controller;

  @override
  void initState() {
    controller = Get.put<LoteSearchController>(
      LoteSearchController(),
    );
    Get.lazyPut<TagListController>(
      () => TagListController([]),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: widget.storageColor?.lighten(20),
      title: Text(
        'Filtros',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ordenar',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: LoteDateOrderDropdown(
                    onChanged: (value) => controller.dateOrder = value,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DateAscDescDropdown(
                    onChanged: (value) => controller.dateAscDesc = value,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Estado',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(),
            ),
            const SizedBox(height: 10),
            LoteStateFilterSection(
              onTypeChanged: (status, isSelected) {
                if (isSelected) {
                  controller.loteStatus.add(status);
                } else {
                  controller.loteStatus.remove(status);
                }
              },
              selectedTagColor:
                  widget.storageColor ?? Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 20),
            Text(
              'Tags',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(),
            ),
            const SizedBox(height: 10),
            TagFilterSection(
              onTypeChanged: (tag, isSelected) {
                if (isSelected) {
                  controller.tags.add(tag);
                } else {
                  controller.tags.remove(tag);
                }
              },
              selectedTagColor:
                  widget.storageColor ?? Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancelar',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        TextButton(
          onPressed: () {
            final loteListController = Get.find<LoteListController>();
            loteListController.searchModel = LoteListSearchModel(
              dateOrder: controller.dateOrder,
              dateAscDesc: controller.dateAscDesc,
              loteStatus:
                  controller.loteStatus.isEmpty ? null : controller.loteStatus,
              tags: controller.tags.isEmpty ? null : controller.tags,
            );
            loteListController.loadLotes();
            Navigator.pop(context);
          },
          child: Text(
            'Aplicar',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
