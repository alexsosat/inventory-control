import 'package:inventory_control/app/data/models/product/product.dart';
import 'package:isar/isar.dart';

import '../models/product_presentation/product_presentation.dart';

class ProductPresentationProvider {
  late Isar isar;

  ProductPresentationProvider() {
    if (Isar.getInstance() == null) {
      throw Exception('Isar is not initialized');
    }
    isar = Isar.getInstance()!;
  }

  /// Get all tags
  Future<List<ProductPresentation>> getAllPresentations() async {
    return isar.productPresentations.where().findAll();
  }

  /// Get presentation by product id
  Future<List<ProductPresentation>> getPresentationsByProductId(
    int? productId,
  ) async {
    if (productId == null) {
      return [];
    }
    final product =
        await isar.products.where().idEqualTo(productId).findFirst();
    if (product == null) {
      return [];
    }
    return product.presentations.toList();
  }

  Future<int> addPresentation(ProductPresentation presentation) async =>
      isar.writeTxn(
        () async => isar.productPresentations.put(presentation),
      );
}
