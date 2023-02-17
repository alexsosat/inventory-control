import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../../../../data/models/storages/storage.dart';
import '../../../../routes/app_pages.dart';

class StorageListItem extends StatelessWidget {
  final Storage storage;

  const StorageListItem(
    this.storage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorFromHex(storage.hexColor),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.warehouse_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          storage.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              storage.lotes.length.toString(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
        onTap: () => Get.toNamed(
          Routes.LOTE_LIST,
          arguments: {
            'title': storage.name,
            'storage': storage,
          },
        ),
      ),
    );
  }
}
