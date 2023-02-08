import 'package:isar/isar.dart';

import '../lote/lote.dart';

part 'storage.g.dart';

@collection
class Storage {
  Id id = Isar.autoIncrement;

  late String name;
  String? address;
  late String hexColor;

  final lotes = IsarLinks<Lote>();
}
