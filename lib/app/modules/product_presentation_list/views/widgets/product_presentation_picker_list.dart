import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/list_tiles/icon_check_box_list_tile.dart';
import '../../../../data/models/product_presentation/product_presentation.dart';
import '../../controllers/product_presentation_list_controller.dart';

class ProductPresentationPickerList
    extends GetView<ProductPresentationListController> {
  final List<ProductPresentation> productPresentations;
  const ProductPresentationPickerList(this.productPresentations, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productPresentations.length,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      itemBuilder: (context, i) => IconCheckBoxTile(
        title: productPresentations[i].name,
        icon: Icons.inventory_2_outlined,
        initialValue:
            controller.selectedPresentations.contains(productPresentations[i]),
        onChanged: (value) {
          if (value) {
            controller.selectedPresentations.add(productPresentations[i]);
          } else {
            controller.selectedPresentations.remove(productPresentations[i]);
          }
        },
      ),
    );
  }
}
