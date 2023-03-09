import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../../../../../constants/values.dart';
import '../../../../data/models/product/product.dart';
import '../../../../routes/app_pages.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: AppValues.kRoundedMedium,
      ),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorFromHex(product.hexColor),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.description_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(product.name),
      subtitle: product.description != null
          ? Text(product.description!)
          : const Text('Sin descripción'),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () => Get.toNamed(
        Routes.PRODUCT_VIEW,
        arguments: product,
      ),
    );
  }
}
