import 'package:flutter/material.dart';

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

class _StorageList extends StatelessWidget {
  const _StorageList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: AppValues.kRoundedMedium,
      ),
      child: Column(
        children: [
          StorageListItem(
            title: 'Bodega 1',
            value: '1000',
            color: Colors.blue,
          ),
          StorageListItem(
            title: 'Bodega 1',
            value: '1000',
            color: Colors.blue,
          ),
          StorageListItem(
            title: 'Bodega 1',
            value: '1000',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
