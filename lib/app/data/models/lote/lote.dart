import 'package:isar/isar.dart';

import '../product/product.dart';
import '../storages/storage.dart';

part 'lote.g.dart';

@collection
class Lote {
  Id id = Isar.autoIncrement;
  @Index(unique: true, replace: true)
  late String loteUID;

  late String hexColor;
  late String quantity;
  DateTime? dateManufacture;
  DateTime? dateExpiration;
  // String? imagePath;

  @Backlink(to: "lotes")
  final storage = IsarLink<Storage>();

  final product = IsarLink<Product>();

  @enumerated
  late LoteStatus status;
}

enum LoteStatus {
  good,
  toExpire,
  expired,
}
