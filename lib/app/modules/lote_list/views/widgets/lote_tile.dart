import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../../data/models/lote/lote.dart';

class LoteTile extends StatelessWidget {
  final Lote lote;
  const LoteTile(this.lote, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorFromHex(lote.hexColor),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.warehouse_rounded,
          color: Colors.white,
        ),
      ),
      title: Text(lote.product.value!.name),
      subtitle: Text(lote.loteUID),
    );
  }
}
