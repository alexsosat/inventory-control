import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Serialization/iconDataSerialization.dart';
import 'package:inventory_control/utils/string_extension.dart';

import '../../../../../global/texts/description_data.dart';
import '../../../../data/models/product/product.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  const ProductInfo(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionData(
          title: "Descripción",
          value: Text(
            product.description.isNotNullOrEmpty
                ? product.description!
                : "Sin descripción",
          ),
        ),
        const SizedBox(height: 20),
        DescriptionData(
          title: "Tags",
          value: Wrap(
            spacing: 10,
            children: product.tags.isNotEmpty
                ? product.tags
                    .map(
                      (e) => Chip(
                        label: Text(e.name),
                        avatar: Icon(
                          e.icon == null
                              ? Icons.tag
                              : deserializeIcon(
                                  json.decode(e.icon!),
                                ),
                        ),
                      ),
                    )
                    .toList()
                : [const Text("No existen etiquetas para este producto")],
          ),
        ),
        const SizedBox(height: 20),
        DescriptionData(
          title: "Presentaciones",
          value: Wrap(
            spacing: 10,
            children: product.presentations
                .map(
                  (e) => Chip(
                    label: Text(e.name),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
