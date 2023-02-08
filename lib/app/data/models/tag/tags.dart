import 'package:isar/isar.dart';

import '../product/product.dart';

part 'tags.g.dart';

@collection
class Tags {
  Id id = Isar.autoIncrement;

  String? name;
  String? description;

  @Backlink(to: 'tags')
  final products = IsarLinks<Product>();
}
