// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import '../tag/tag.dart';

part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement;

  final String name;
  String? description;
  // final String image;
  final String hexColor;

  @enumerated
  late MetricUnit metricUnit;

  Product({
    required this.name,
    this.description,
    required this.hexColor,
    required this.metricUnit,
  });

  final tags = IsarLinks<Tag>();
}

enum MetricUnit {
  kg,
  g,
  l,
  ml,
  unidades,
}
