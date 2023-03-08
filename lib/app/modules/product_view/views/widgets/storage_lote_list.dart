import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/storages/storage.dart';
import '../../../lote_list/views/widgets/lote_tile.dart';
import '../../controllers/product_view_controller.dart';

class StorageLotesList extends GetView<ProductViewController> {
  final List<Storage> storages;

  const StorageLotesList(this.storages, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: controller
            .getLotesByStorage(storages[controller.storageIndex.value])
            .map(
              (e) => LoteTile(e),
            )
            .toList(),
      ),
    );
  }
}
