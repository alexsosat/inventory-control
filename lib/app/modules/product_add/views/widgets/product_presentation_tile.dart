import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../../../utils/remove_focus.dart';
import '../../../../data/models/product_presentation/product_presentation.dart';
import '../../../../routes/app_pages.dart';

class ProductPresentationTile extends StatefulWidget {
  final Function(List<ProductPresentation> presentations)
      onProductPresentationChanged;

  const ProductPresentationTile({
    required this.onProductPresentationChanged,
    super.key,
  });

  @override
  State<ProductPresentationTile> createState() =>
      _ProductPresentationTileState();
}

class _ProductPresentationTileState extends State<ProductPresentationTile> {
  List<ProductPresentation> _productPresentations = [];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.inventory_2_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      title: const Text("Presentaciones"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _productPresentations.length.toString(),
            style: const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
      onTap: () async {
        removeFocus(context);

        final presentations = await Get.toNamed(
              Routes.PRODUCT_PRESENTATION_LIST,
            ) ??
            [];

        _productPresentations = presentations as List<ProductPresentation>;

        widget.onProductPresentationChanged(_productPresentations);

        setState(() {});
      },
    );
  }
}
