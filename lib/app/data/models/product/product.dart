import 'package:isar/isar.dart';

import '../tag/tag.dart';

part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement;
  late String name;
  late String description;
  // final String image;
  late String hexColor;

  @enumerated
  late MetricUnit metricUnit;

  final tags = IsarLinks<Tag>();
}

enum MetricUnit {
  kg,
  g,
  l,
  ml,
  unidades,
}
