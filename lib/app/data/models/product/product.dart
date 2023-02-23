// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

import '../product_presentation/product_presentation.dart';
import '../tag/tag.dart';

part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement;

  final String name;
  String? description;
  // final String image;
  final String hexColor;

  Product({
    required this.name,
    this.description,
    required this.hexColor,
  });

  final presentations = IsarLinks<ProductPresentation>();

  final tags = IsarLinks<Tag>();

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, hexColor: $hexColor)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.hexColor == hexColor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        hexColor.hashCode;
  }
}
