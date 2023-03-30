import 'package:isar/isar.dart';

import '../models/product/product.dart';

class ProductProvider {
  late Isar isar;

  ProductProvider() {
    if (Isar.getInstance() == null) {
      throw Exception('Isar is not initialized');
    }
    isar = Isar.getInstance()!;
  }

  /// Get all the products from the database.
  Future<List<Product>> getProductsList() async =>
      isar.products.where().findAll();

  ///Get product count
  ///Returns the number of products in the database
  Future<int> getProductCount() async => isar.products.count();

  /// Adds a product to the database.
  ///
  /// Args:
  ///   product (Product): The product object to be added to the database.
  Future<int> addProduct(Product product) async {
    final id = await isar.writeTxn<int>(
      () async {
        final productId = await isar.products.put(product);
        return productId;
      },
    );

    final tempTags = product.tags.toList();
    final tempPresentations = product.presentations.toList();

    await isar.writeTxn(() async {
      await product.tags.reset();
      await product.presentations.reset();

      for (final tag in tempTags) {
        product.tags.add(tag);
      }
      for (final presentation in tempPresentations) {
        product.presentations.add(presentation);
      }

      await product.tags.save();
      await product.presentations.save();
    });

    return id;
  }

  /// Deletes a product from the database.
  ///
  /// Args:
  ///  productId (int): The id of the product to be deleted.
  Future<void> deleteProduct(int productId) async => isar.writeTxn(
        () async => isar.products.delete(productId),
      );
}
