// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lote.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLoteCollection on Isar {
  IsarCollection<Lote> get lotes => this.collection();
}

const LoteSchema = CollectionSchema(
  name: r'Lote',
  id: -5757768337345954602,
  properties: {
    r'dateCreated': PropertySchema(
      id: 0,
      name: r'dateCreated',
      type: IsarType.dateTime,
    ),
    r'dateExpiration': PropertySchema(
      id: 1,
      name: r'dateExpiration',
      type: IsarType.dateTime,
    ),
    r'dateManufacture': PropertySchema(
      id: 2,
      name: r'dateManufacture',
      type: IsarType.dateTime,
    ),
    r'hashCode': PropertySchema(
      id: 3,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'hexColor': PropertySchema(
      id: 4,
      name: r'hexColor',
      type: IsarType.string,
    ),
    r'loteUID': PropertySchema(
      id: 5,
      name: r'loteUID',
      type: IsarType.string,
    ),
    r'place': PropertySchema(
      id: 6,
      name: r'place',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 7,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.byte,
      enumMap: _LotestatusEnumValueMap,
    )
  },
  estimateSize: _loteEstimateSize,
  serialize: _loteSerialize,
  deserialize: _loteDeserialize,
  deserializeProp: _loteDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'storage': LinkSchema(
      id: -9197403507323110897,
      name: r'storage',
      target: r'Storage',
      single: true,
      linkName: r'lotes',
    ),
    r'product': LinkSchema(
      id: -8827434066767641345,
      name: r'product',
      target: r'Product',
      single: true,
    ),
    r'productPresentation': LinkSchema(
      id: -8354730509148323228,
      name: r'productPresentation',
      target: r'ProductPresentation',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _loteGetId,
  getLinks: _loteGetLinks,
  attach: _loteAttach,
  version: '3.0.5',
);

int _loteEstimateSize(
  Lote object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.hexColor.length * 3;
  bytesCount += 3 + object.loteUID.length * 3;
  bytesCount += 3 + object.place.length * 3;
  return bytesCount;
}

void _loteSerialize(
  Lote object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateCreated);
  writer.writeDateTime(offsets[1], object.dateExpiration);
  writer.writeDateTime(offsets[2], object.dateManufacture);
  writer.writeLong(offsets[3], object.hashCode);
  writer.writeString(offsets[4], object.hexColor);
  writer.writeString(offsets[5], object.loteUID);
  writer.writeString(offsets[6], object.place);
  writer.writeDouble(offsets[7], object.quantity);
  writer.writeByte(offsets[8], object.status.index);
}

Lote _loteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Lote(
    dateCreated: reader.readDateTime(offsets[0]),
    dateExpiration: reader.readDateTime(offsets[1]),
    dateManufacture: reader.readDateTime(offsets[2]),
    hexColor: reader.readString(offsets[4]),
    loteUID: reader.readString(offsets[5]),
    place: reader.readString(offsets[6]),
    quantity: reader.readDouble(offsets[7]),
    status: _LotestatusValueEnumMap[reader.readByteOrNull(offsets[8])] ??
        LoteStatus.good,
  );
  object.id = id;
  return object;
}

P _loteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (_LotestatusValueEnumMap[reader.readByteOrNull(offset)] ??
          LoteStatus.good) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LotestatusEnumValueMap = {
  'good': 0,
  'toExpire': 1,
  'expired': 2,
};
const _LotestatusValueEnumMap = {
  0: LoteStatus.good,
  1: LoteStatus.toExpire,
  2: LoteStatus.expired,
};

Id _loteGetId(Lote object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _loteGetLinks(Lote object) {
  return [object.storage, object.product, object.productPresentation];
}

void _loteAttach(IsarCollection<dynamic> col, Id id, Lote object) {
  object.id = id;
  object.storage.attach(col, col.isar.collection<Storage>(), r'storage', id);
  object.product.attach(col, col.isar.collection<Product>(), r'product', id);
  object.productPresentation.attach(col,
      col.isar.collection<ProductPresentation>(), r'productPresentation', id);
}

extension LoteQueryWhereSort on QueryBuilder<Lote, Lote, QWhere> {
  QueryBuilder<Lote, Lote, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LoteQueryWhere on QueryBuilder<Lote, Lote, QWhereClause> {
  QueryBuilder<Lote, Lote, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Lote, Lote, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Lote, Lote, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Lote, Lote, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LoteQueryFilter on QueryBuilder<Lote, Lote, QFilterCondition> {
  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateCreatedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateCreatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateCreatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateCreated',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateCreatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateCreated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateExpirationEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateExpiration',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateExpirationGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateExpiration',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateExpirationLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateExpiration',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateExpirationBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateExpiration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateManufactureEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateManufacture',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateManufactureGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateManufacture',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateManufactureLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateManufacture',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateManufactureBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateManufacture',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hexColorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hexColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hexColorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hexColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hexColorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hexColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hexColorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hexColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hexColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hexColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hexColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hexColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hexColorContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hexColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hexColorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hexColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hexColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hexColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> hexColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hexColor',
        value: '',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> loteUIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loteUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> loteUIDGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loteUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> loteUIDLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loteUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> loteUIDBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loteUID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> loteUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'loteUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> loteUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'loteUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> loteUIDContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'loteUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> loteUIDMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'loteUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> loteUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loteUID',
        value: '',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> loteUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'loteUID',
        value: '',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> placeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> placeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> placeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> placeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'place',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> placeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> placeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> placeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> placeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'place',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> placeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'place',
        value: '',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> placeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'place',
        value: '',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> statusEqualTo(
      LoteStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> statusGreaterThan(
    LoteStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> statusLessThan(
    LoteStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> statusBetween(
    LoteStatus lower,
    LoteStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LoteQueryObject on QueryBuilder<Lote, Lote, QFilterCondition> {}

extension LoteQueryLinks on QueryBuilder<Lote, Lote, QFilterCondition> {
  QueryBuilder<Lote, Lote, QAfterFilterCondition> storage(
      FilterQuery<Storage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'storage');
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> storageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'storage', 0, true, 0, true);
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> product(
      FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'product');
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'product', 0, true, 0, true);
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> productPresentation(
      FilterQuery<ProductPresentation> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'productPresentation');
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> productPresentationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'productPresentation', 0, true, 0, true);
    });
  }
}

extension LoteQuerySortBy on QueryBuilder<Lote, Lote, QSortBy> {
  QueryBuilder<Lote, Lote, QAfterSortBy> sortByDateCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreated', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByDateCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreated', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByDateExpiration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateExpiration', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByDateExpirationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateExpiration', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByDateManufacture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateManufacture', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByDateManufactureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateManufacture', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByHexColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hexColor', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByHexColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hexColor', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByLoteUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteUID', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByLoteUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteUID', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByPlace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'place', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByPlaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'place', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension LoteQuerySortThenBy on QueryBuilder<Lote, Lote, QSortThenBy> {
  QueryBuilder<Lote, Lote, QAfterSortBy> thenByDateCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreated', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByDateCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreated', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByDateExpiration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateExpiration', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByDateExpirationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateExpiration', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByDateManufacture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateManufacture', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByDateManufactureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateManufacture', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByHexColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hexColor', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByHexColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hexColor', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByLoteUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteUID', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByLoteUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loteUID', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByPlace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'place', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByPlaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'place', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Lote, Lote, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension LoteQueryWhereDistinct on QueryBuilder<Lote, Lote, QDistinct> {
  QueryBuilder<Lote, Lote, QDistinct> distinctByDateCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateCreated');
    });
  }

  QueryBuilder<Lote, Lote, QDistinct> distinctByDateExpiration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateExpiration');
    });
  }

  QueryBuilder<Lote, Lote, QDistinct> distinctByDateManufacture() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateManufacture');
    });
  }

  QueryBuilder<Lote, Lote, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Lote, Lote, QDistinct> distinctByHexColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hexColor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lote, Lote, QDistinct> distinctByLoteUID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loteUID', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lote, Lote, QDistinct> distinctByPlace(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'place', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lote, Lote, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<Lote, Lote, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension LoteQueryProperty on QueryBuilder<Lote, Lote, QQueryProperty> {
  QueryBuilder<Lote, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Lote, DateTime, QQueryOperations> dateCreatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateCreated');
    });
  }

  QueryBuilder<Lote, DateTime, QQueryOperations> dateExpirationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateExpiration');
    });
  }

  QueryBuilder<Lote, DateTime, QQueryOperations> dateManufactureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateManufacture');
    });
  }

  QueryBuilder<Lote, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Lote, String, QQueryOperations> hexColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hexColor');
    });
  }

  QueryBuilder<Lote, String, QQueryOperations> loteUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loteUID');
    });
  }

  QueryBuilder<Lote, String, QQueryOperations> placeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'place');
    });
  }

  QueryBuilder<Lote, double, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<Lote, LoteStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
