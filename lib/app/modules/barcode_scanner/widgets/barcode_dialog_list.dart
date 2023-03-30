import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/route_manager.dart';

import '../../../../constants/values.dart';
import '../../../data/models/lote/lote.dart';
import '../../../routes/app_pages.dart';

class BarcodeScanResultDialog extends StatelessWidget {
  final List<Lote> lotes;

  const BarcodeScanResultDialog({
    required this.lotes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Lotes encontrados: ${lotes.length}'),
      content: ListView.separated(
        itemCount: lotes.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: AppValues.kRoundedMedium,
            ),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorFromHex(lotes[index].hexColor),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.inventory_2_outlined,
                color: Colors.white,
              ),
            ),
            title: Text(lotes[index].product.value!.name),
            subtitle: Text(lotes[index].storage.value!.name),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              Get.back();
              Get.toNamed(
                Routes.LOTE_VIEW,
                arguments: lotes[index],
              );
            },
          );
        },
      ),
    );
  }
}
