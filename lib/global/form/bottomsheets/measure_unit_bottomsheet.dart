import 'package:flutter/material.dart';

import '../../../app/data/models/product_presentation/product_presentation.dart';
import 'base_bottomsheet.dart';

class MeasureUnitBottomSheet extends StatelessWidget {
  final Function(MeasureUnit) onChanged;
  final MeasureUnit? initialItem;
  const MeasureUnitBottomSheet({
    Key? key,
    required this.onChanged,
    this.initialItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet<MeasureUnit>(
      labelText: "Unidad de medida",
      items: MeasureUnit.values,
      initialItem: initialItem,
      itemAsString: (unit) => "${unit.fullUnit} (${unit.name})",
      leadingIcon: Icons.unarchive_outlined,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
