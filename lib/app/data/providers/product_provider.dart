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

  /// It adds a product to the database.
  ///
  /// Args:
  ///   product (Product): The product object to be added to the database.
  Future<int> addProduct(Product product) async => isar.writeTxn<int>(
        () async {
          final productId = await isar.products.put(product);
          await product.tags.save();
          return productId;
        },
      );
}
