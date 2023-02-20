// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  double quantity;
  DateTime dateManufacture;
  DateTime dateExpiration;
  DateTime dateCreated;
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
    required this.dateCreated,
    this.status = LoteStatus.good,
  });

  @override
  bool operator ==(covariant Lote other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.loteUID == loteUID &&
        other.hexColor == hexColor &&
        other.quantity == quantity &&
        other.dateManufacture == dateManufacture &&
        other.dateExpiration == dateExpiration &&
        other.dateCreated == dateCreated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        loteUID.hashCode ^
        hexColor.hashCode ^
        quantity.hashCode ^
        dateManufacture.hashCode ^
        dateExpiration.hashCode ^
        dateCreated.hashCode;
  }

  @override
  String toString() {
    return 'Lote(id: $id, loteUID: $loteUID, hexColor: $hexColor, quantity: $quantity, dateManufacture: $dateManufacture, dateExpiration: $dateExpiration, dateCreated: $dateCreated)';
  }
}

enum LoteStatus {
  good,
  toExpire,
  expired,
}
