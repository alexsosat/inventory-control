// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'product_presentation.g.dart';

@collection
class ProductPresentation {
  Id id = Isar.autoIncrement;

  final String name;

  @enumerated
  final MeasureUnit unit;

  ProductPresentation({
    required this.name,
    required this.unit,
  });

  String get fullString => '$name ${unit.fullUnit}';

  @override
  String toString() =>
      'ProductPresentation(id: $id, name: $name, description: $unit)';

  @override
  bool operator ==(covariant ProductPresentation other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.unit == unit;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ unit.hashCode;
}

enum MeasureUnit {
  kg,
  g,
  l,
  ml,
  u,
}

extension UnitExtension on MeasureUnit {
  String get fullUnit {
    switch (this) {
      case MeasureUnit.kg:
        return "Kilogramos";
      case MeasureUnit.g:
        return "Gramos";
      case MeasureUnit.l:
        return "Litros";
      case MeasureUnit.ml:
        return "Mililitros";
      case MeasureUnit.u:
        return "Unidades";
      default:
        return "Unidades";
    }
  }
}
