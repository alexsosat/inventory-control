import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../global/texts/row_data.dart';
import '../../../../data/models/lote/lote.dart';

class LoteInfo extends StatelessWidget {
  final Lote lote;
  const LoteInfo(this.lote, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          lote.loteUID,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(),
        ),
        const SizedBox(height: 20),
        RowData(
          title: "Presentación",
          value: lote.productPresentation.value!.name,
        ),
        const Divider(),
        RowData(
          title: "Lugar de almacenamiento",
          value: lote.place,
        ),
        const Divider(),
        RowData(
          title: "Cantidad",
          value: lote.quantity.toString(),
        ),
        const Divider(),
        RowData(
          title: "Fecha de vencimiento",
          value: DateFormat('dd/MM/yyyy').format(lote.dateExpiration),
        ),
        const Divider(),
        RowData(
          title: "Fecha de manufactura",
          value: DateFormat('dd/MM/yyyy').format(lote.dateManufacture),
        ),
        const Divider(),
        RowData(
          title: "Bodega",
          value: lote.storage.value!.name,
        ),
        const Divider(),
        _buildStatusRow(),
        const SizedBox(height: 100),
      ],
    );
  }

  _buildStatusRow() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            "Estado:",
            style: Get.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        Expanded(
          child: _buildStatusContainer(),
        ),
      ],
    );
  }

  _buildStatusContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.zero,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: lote.status.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        lote.status.name,
        textAlign: TextAlign.center,
        style: Get.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
