import 'package:isar/isar.dart';

import '../product/product.dart';

part 'tag.g.dart';

@collection
class Tag {
  Id id = Isar.autoIncrement;

  final String name;
  String? description;
  String? icon;

  Tag({
    required this.name,
    this.description,
    this.icon,
  });

  @Backlink(to: 'tags')
  final products = IsarLinks<Product>();

  @override
  bool operator ==(covariant Tag other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}
