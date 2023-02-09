import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../app/data/models/product/product.dart';
import '../../../utils/enum_convertors.dart';
import 'base_bottomsheet.dart';

class MetricUnitBottomSheet extends StatelessWidget {
  final Function(MetricUnit) onChanged;
  const MetricUnitBottomSheet({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet<String>(
      labelText: "Unidad de Medida",
      items: MetricUnit.values
          .map(
            (e) => enumToString(e),
          )
          .toList(),
      onChanged: (value) {
        onChanged(enumFromString(value, MetricUnit.values)!);
      },
    );
  }
}
