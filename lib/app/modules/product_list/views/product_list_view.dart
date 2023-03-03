import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/product/product.dart';
import '../controllers/product_list_controller.dart';
import 'widgets/product_search_section.dart';
import 'widgets/product_tile.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de productos"),
        centerTitle: false,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: ProductSearchSection(
            storageColor: null,
          ),
        ),
      ),
      body: controller.obx(
        (products) => Obx(
          () {
            List<Product> filteredProducts = products!;

            if (controller.searchText.value.isNotEmpty) {
              filteredProducts =
                  controller.filterProductsByQuery(filteredProducts);
            }
            if (controller.tags.isNotEmpty) {
              filteredProducts =
                  controller.filterProductsByTags(filteredProducts);
            }

            return ListView.separated(
              itemCount: filteredProducts.length,
              padding: const EdgeInsets.all(20),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) =>
                  ProductTile(filteredProducts[index]),
            );
          },
        ),
        onEmpty: Center(
          child: Text(
            'No hay productos para mostrar',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(),
          ),
        ),
      ),
    );
  }
}
