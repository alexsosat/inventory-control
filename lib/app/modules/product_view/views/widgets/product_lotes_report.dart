import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/values.dart';
import '../../../../data/models/product/product.dart';
import '../../../lote_list/views/widgets/lote_tile.dart';
import '../../controllers/product_view_controller.dart';
import 'storage_list_bar.dart';
import 'storage_lote_list.dart';

class ProductLotesReport extends StatefulWidget {
  final Product product;
  const ProductLotesReport(this.product, {super.key});

  @override
  State<ProductLotesReport> createState() => _ProductLotesReportState();
}

class _ProductLotesReportState extends State<ProductLotesReport> {
  late ProductViewController _controller;

  @override
  void initState() {
    _controller = Get.find<ProductViewController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.obx(
      (value) => Column(
        children: [
          StorageListBar(
            value!.storages,
          ),
          const SizedBox(height: 20),
          StorageLotesList(
            value.storages,
          ),
        ],
      ),

      // DefaultTabController(
      //   length: value!.storages.length,
      //   child: Column(
      //     children: [
      //       ClipRRect(
      //         borderRadius: BorderRadius.circular(20),
      //         child: SizedBox(
      //           width: double.infinity,
      //           child: Material(
      //             color: Colors.white,
      //             child: TabBar(
      //               isScrollable: value.storages.length > 4,
      //               unselectedLabelColor: context.theme.hintColor,
      //               unselectedLabelStyle:
      //                   context.textTheme.bodyMedium!.copyWith(
      //                 fontWeight: FontWeight.normal,
      //               ),
      //               labelColor: Get.theme.colorScheme.secondary,
      //               labelStyle: context.textTheme.bodyMedium!.copyWith(
      //                 fontWeight: FontWeight.bold,
      //               ),
      //               tabs: value.storages
      //                   .map((storage) => Tab(
      //                         text: storage.name,
      //                         icon: const Icon(Icons.warehouse_rounded),
      //                       ))
      //                   .toList(),
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 20),
      //       SizedBox(
      //         height: 500,
      //         width: double.infinity,
      //         child: TabBarView(
      //           children: value.storages.map(
      //             (storage) {
      //               final lotes = _controller.getLotesByStorage(storage);

      //               return ListView.builder(
      //                 itemCount: lotes.length,
      //                 itemBuilder: (context, index) => LoteTile(lotes[index]),
      //               );
      //             },
      //           ).toList(),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      onEmpty: const Center(child: Text('No hay lotes')),
    );
  }
}
