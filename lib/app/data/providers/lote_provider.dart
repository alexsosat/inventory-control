import 'package:isar/isar.dart';

import '../models/lote/lote.dart';
import '../models/product/product.dart';

class LoteProvider {
  late Isar isar;

  LoteProvider() {
    if (Isar.getInstance() == null) {
      throw Exception('Isar is not initialized');
    }
    isar = Isar.getInstance()!;
  }

  /// Get all the lots.
  Future<List<Lote>> getAllLotes() async => await isar.lotes.where().findAll();

  /// Get all the lots by product.
  /// Args:
  /// productId (int): The product id.
  Future<List<Lote>> getLotesByProduct(int productId) async => await isar.lotes
      .filter()
      .product(
        (q) => q.idEqualTo(productId),
      )
      .findAll();

  /// Get Lotes by status
  Future<List<Lote>> getLotesByStatus(LoteStatus status) async =>
      await isar.lotes.filter().statusEqualTo(status).findAll();

  /// Get the number of lots that are status.
  Future<int> getLotesByStatusCount(LoteStatus status) async =>
      await isar.lotes.filter().statusEqualTo(status).count();

  /// Get all the lots by loteUID.
  /// Args:
  /// loteUID (String): The loteUID.
  Future<List<Lote>> getLotesByLoteUID(String loteUID) async =>
      await isar.lotes.filter().loteUIDEqualTo(loteUID).findAll();

  /// Adds a Lote to the database
  Future<int> addLote(Lote lote) async => isar.writeTxn<int>(
        () async {
          final productId = await isar.lotes.put(lote);
          await lote.product.save();
          await lote.storage.save();
          await lote.productPresentation.save();
          return productId;
        },
      );

  /// Updates a Lote
  /// Args:
  ///  lote (Lote): The Lote object to be updated.
  Future updateLote(Lote lote) async => isar.writeTxn(
        () async {
          await isar.lotes.put(lote);
          await lote.product.save();
          await lote.storage.save();
          await lote.productPresentation.save();
        },
      );

  /// Updates the status of a Lote
  Future updateLoteStatus({
    required Lote lote,
    required LoteStatus moveTo,
  }) async {
    lote.status = moveTo;
    await isar.writeTxn(() async {
      await isar.lotes.put(lote);
    });
  }

  /// Deletes a Lote
  /// Args:
  /// lote (Lote): The Lote object to be deleted.
  Future deleteLote(Lote lote) async => isar.writeTxn(
        () async {
          await isar.lotes.delete(lote.id);
        },
      );
}
