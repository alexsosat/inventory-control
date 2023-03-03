import 'package:get/get.dart';

import '../../../data/models/product/product.dart';
import '../../../data/models/tag/tag.dart';
import '../../../data/providers/product_provider.dart';

class ProductListController extends GetxController
    with StateMixin<List<Product>> {
  final ProductProvider _productProvider = ProductProvider();

  final tags = [].obs;
  final searchText = ''.obs;

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  loadProducts() async {
    change(null, status: RxStatus.loading());
    try {
      final products = await _productProvider.getProductsList();

      if (products.isNotEmpty) {
        change(products, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  addTag(Tag tag) => tags.add(tag);

  removeTag(Tag tag) => tags.remove(tag);

  List<Product> filterProductsByQuery(List<Product> products) {
    if (searchText.isEmpty) return products;

    List<Product> filteredProducts = [];

    for (Product product in products) {
      if (product.name.toLowerCase().contains(searchText.value.toLowerCase())) {
        filteredProducts.add(product);
      }
    }

    return filteredProducts;
  }

  List<Product> filterProductsByTags(List<Product> products) {
    if (tags.isEmpty) return products;

    List<Product> filteredProducts = [];

    for (Product product in products) {
      if (product.tags.isNotEmpty) {
        if (tags.any((tag) => product.tags.contains(tag))) {
          filteredProducts.add(product);
        }
      }
    }

    return filteredProducts;
  }
}
