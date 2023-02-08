import 'package:inventory_control/app/data/models/lote/lote.dart';
import 'package:isar/isar.dart';

class LotesProvider {
  late Isar isar;

  LotesProvider() {
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
}
