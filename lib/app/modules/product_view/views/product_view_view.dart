import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'widgets/product_info.dart';
import 'widgets/product_pop_up_menu.dart';
import '../../../../global/texts/description_data.dart';

import '../controllers/product_view_controller.dart';
import 'widgets/product_lotes_report.dart';

class ProductViewView extends GetView<ProductViewController> {
  const ProductViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.product.name.capitalize!),
        centerTitle: false,
        actions: const [ProductPopUpMenu()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ProductInfo(controller.product),
            const SizedBox(height: 30),
            DescriptionData(
              title: "Lotes",
              value: ProductLotesReport(controller.product),
            ),
          ],
        ),
      ),
    );
  }
}
