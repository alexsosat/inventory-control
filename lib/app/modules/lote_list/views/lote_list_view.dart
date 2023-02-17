import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/lote_list_controller.dart';
import 'widgets/lote_tile.dart';
import 'widgets/search_section.dart';

class LoteListView extends GetView<LoteListController> {
  const LoteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.pageTitle.capitalize!),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: LoteSearchSection(
            storageColor: controller.storage != null
                ? colorFromHex(controller.storage!.hexColor)
                : null,
          ),
        ),
      ),
      body: controller.obx(
        (lotes) => ListView.builder(
          itemCount: lotes!.length,
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) => LoteTile(lotes[index]),
        ),
        onEmpty: Center(
          child: Text(
            'No hay lotes en este almacen',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(
          Routes.LOTE_ADD,
          arguments: controller.storage,
        ),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
