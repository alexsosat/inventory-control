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
}
