import 'package:flutter/material.dart';
import 'package:inventory_control/app/data/models/product/product.dart';
import '../../../app/data/providers/product_provider.dart';

import 'base_bottomsheet.dart';

class ProductBottomSheet extends StatelessWidget {
  final Function(Product) onChanged;
  final Product? initialItem;
  const ProductBottomSheet({
    Key? key,
    required this.onChanged,
    this.initialItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet<Product>(
      labelText: "Producto",
      items: const [],
      initialItem: initialItem,
      asyncItems: (_) => ProductProvider().getProductsList(),
      itemAsString: (storage) => storage.name,
      leadingIcon: Icons.receipt_long_rounded,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
