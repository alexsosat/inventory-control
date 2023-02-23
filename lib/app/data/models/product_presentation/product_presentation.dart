// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'product_presentation.g.dart';

@collection
class ProductPresentation {
  Id id = Isar.autoIncrement;

  final String name;
  String? description;

  ProductPresentation({
    required this.name,
    this.description,
  });

  @override
  String toString() =>
      'ProductPresentation(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(covariant ProductPresentation other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
