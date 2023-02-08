import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:inventory_control/app/modules/home/controllers/storage_list_controller.dart';

import '../../../../../constants/values.dart';
import '../widgets/storage_list_item.dart';

class StorageListSection extends StatelessWidget {
  const StorageListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bodegas',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 20),
        const _StorageList(),
      ],
    );
  }
}

class _StorageList extends GetView<StorageListController> {
  const _StorageList();

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (storages) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: AppValues.kRoundedMedium,
        ),
        child: Column(
          children: storages!
              .map(
                (storage) => StorageListItem(
                  title: storage.name,
                  value: storage.lotes.length.toString(),
                  color:
                      colorFromHex(storage.hexColor) ?? Get.theme.primaryColor,
                ),
              )
              .toList(),
        ),
      ),
      onEmpty: const Text("Actualmente no tienes bodegas"),
    );
  }
}
