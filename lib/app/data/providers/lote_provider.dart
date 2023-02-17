import '../models/lote/lote.dart';
import 'package:isar/isar.dart';

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

  /// Get Lotes by status
  Future<List<Lote>> getLotesByStatus(LoteStatus status) async =>
      await isar.lotes.filter().statusEqualTo(status).findAll();

  /// Get the number of lots that are status.
  Future<int> getLotesByStatusCount(LoteStatus status) async =>
      await isar.lotes.filter().statusEqualTo(status).count();

  /// Adds a Lote to the database
  Future<int> addLote(Lote lote) async => isar.writeTxn<int>(
        () async {
          final productId = await isar.lotes.put(lote);
          await lote.product.save();
          await lote.storage.save();
          return productId;
        },
      );

  Future moveLoteToCloseToExpired(Lote lote) async {
    lote.status = LoteStatus.toExpire;
    await isar.writeTxn(() async {
      await isar.lotes.put(lote);
    });
  }

  Future moveLoteToExpired(Lote lote) async {
    lote.status = LoteStatus.expired;
    await isar.writeTxn(() async {
      await isar.lotes.put(lote);
    });
  }
}
