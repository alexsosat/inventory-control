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

  /// Get the number of lots that are good.
  Future<int> getGoodLotesCount() async =>
      await isar.lotes.filter().statusEqualTo(LoteStatus.good).count();

  /// Get the number of lots that are expired.
  Future<int> getExpiredLotesCount() async =>
      await isar.lotes.filter().statusEqualTo(LoteStatus.expired).count();

  /// Get the number of lots that are about to expire.
  Future<int> getToExpireLotesCount() async =>
      await isar.lotes.filter().statusEqualTo(LoteStatus.toExpire).count();

  /// Get all the lots that are in good status.
  Future<List<Lote>> getGoodLotes() async =>
      await isar.lotes.filter().statusEqualTo(LoteStatus.good).findAll();

  /// Get all the lots that are in expired status.
  Future<List<Lote>> getExpiredLotes() async =>
      await isar.lotes.filter().statusEqualTo(LoteStatus.expired).findAll();

  /// Get all the lots that are in about to expire status.
  Future<List<Lote>> getToExpireLotes() async =>
      await isar.lotes.filter().statusEqualTo(LoteStatus.toExpire).findAll();

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
