import 'package:isar/isar.dart';

import '../product/product.dart';
import '../storages/storage.dart';

part 'lote.g.dart';

@collection
class Lote {
  Id id = Isar.autoIncrement;
  @Index(unique: true, replace: true)
  String loteUID;

  String hexColor;
  String quantity;
  DateTime dateManufacture;
  DateTime dateExpiration;
  // String? imagePath;

  @Backlink(to: "lotes")
  final storage = IsarLink<Storage>();

  final product = IsarLink<Product>();

  @enumerated
  LoteStatus status;

  Lote({
    required this.loteUID,
    required this.hexColor,
    required this.quantity,
    required this.dateManufacture,
    required this.dateExpiration,
    this.status = LoteStatus.good,
  });
}

enum LoteStatus {
  good,
  toExpire,
  expired,
}
