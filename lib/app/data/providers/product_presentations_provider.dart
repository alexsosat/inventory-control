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

  Future<int> addPresentation(ProductPresentation presentation) async =>
      isar.writeTxn(
        () async => isar.productPresentations.put(presentation),
      );
}
