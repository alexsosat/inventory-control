import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/values.dart';
import '../../../../data/models/lote/lote.dart';
import '../../../../routes/app_pages.dart';

class LoteTile extends StatelessWidget {
  final Lote lote;
  const LoteTile(this.lote, {super.key});

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
          color: colorFromHex(lote.hexColor),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.warehouse_rounded,
          color: Colors.white,
        ),
      ),
      title: Text(lote.product.value!.name),
      subtitle: Text(
        DateFormat('dd/MM/yyyy').format(lote.dateExpiration),
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () => Get.toNamed(
        Routes.LOTE_VIEW,
        arguments: lote,
      ),
    );
  }
}
