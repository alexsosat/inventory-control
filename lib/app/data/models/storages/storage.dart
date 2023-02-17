// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import '../lote/lote.dart';

part 'storage.g.dart';

@collection
class Storage {
  Id id = Isar.autoIncrement;

  String name;
  String? address;
  String hexColor;

  final lotes = IsarLinks<Lote>();

  Storage({
    required this.name,
    this.address,
    required this.hexColor,
  });

  @override
  bool operator ==(covariant Storage other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.hexColor == hexColor;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ address.hashCode ^ hexColor.hashCode;
  }

  @override
  String toString() {
    return 'Storage(id: $id, name: $name, address: $address, hexColor: $hexColor)';
  }
}
