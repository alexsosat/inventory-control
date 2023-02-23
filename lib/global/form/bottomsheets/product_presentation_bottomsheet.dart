import 'package:flutter/material.dart';
import '../../../app/data/models/product_presentation/product_presentation.dart';
import '../../../app/data/providers/product_presentations_provider.dart';

import 'base_bottomsheet.dart';

class ProductPresentationBottomSheet extends StatelessWidget {
  final Function(ProductPresentation) onChanged;
  final int? productId;
  final ProductPresentation? initialPresentation;
  const ProductPresentationBottomSheet({
    Key? key,
    required this.onChanged,
    this.initialPresentation,
    this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet<ProductPresentation>(
      labelText: "Presentación de producto",
      items: const [],
      initialItem: initialPresentation,
      asyncItems: (_) =>
          ProductPresentationProvider().getPresentationsByProductId(productId),
      itemAsString: (presentation) => presentation.name,
      leadingIcon: Icons.inventory_2_outlined,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
