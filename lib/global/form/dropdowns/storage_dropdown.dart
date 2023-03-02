import 'package:flutter/material.dart';

import '../../../app/data/models/storages/storage.dart';
import '../../../app/data/providers/storage_provider.dart';
import 'base_dropdown.dart';

class StorageDropdown extends StatelessWidget {
  final Function(Storage) onChanged;
  final Storage? initialItem;
  const StorageDropdown({
    Key? key,
    required this.onChanged,
    this.initialItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDropdown<Storage>(
      labelText: "Bodega",
      items: const [],
      initialItem: initialItem,
      asyncItems: (_) => StorageProvider().getStorageList(),
      itemAsString: (storage) => storage.name,
      leadingIcon: Icons.warehouse_rounded,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
