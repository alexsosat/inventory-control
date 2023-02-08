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
    r'dateExpiration': PropertySchema(
      id: 0,
      name: r'dateExpiration',
      type: IsarType.dateTime,
    ),
    r'dateManufacture': PropertySchema(
      id: 1,
      name: r'dateManufacture',
      type: IsarType.dateTime,
    ),
    r'hexColor': PropertySchema(
      id: 2,
      name: r'hexColor',
      type: IsarType.string,
    ),
    r'loteUID': PropertySchema(
      id: 3,
      name: r'loteUID',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 4,
      name: r'quantity',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 5,
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
  indexes: {
    r'loteUID': IndexSchema(
      id: -5977357089534631101,
      name: r'loteUID',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'loteUID',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
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
  bytesCount += 3 + object.quantity.length * 3;
  return bytesCount;
}

void _loteSerialize(
  Lote object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateExpiration);
  writer.writeDateTime(offsets[1], object.dateManufacture);
  writer.writeString(offsets[2], object.hexColor);
  writer.writeString(offsets[3], object.loteUID);
  writer.writeString(offsets[4], object.quantity);
  writer.writeByte(offsets[5], object.status.index);
}

Lote _loteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Lote();
  object.dateExpiration = reader.readDateTimeOrNull(offsets[0]);
  object.dateManufacture = reader.readDateTimeOrNull(offsets[1]);
  object.hexColor = reader.readString(offsets[2]);
  object.id = id;
  object.loteUID = reader.readString(offsets[3]);
  object.quantity = reader.readString(offsets[4]);
  object.status = _LotestatusValueEnumMap[reader.readByteOrNull(offsets[5])] ??
      LoteStatus.good;
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
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
  return [object.storage, object.product];
}

void _loteAttach(IsarCollection<dynamic> col, Id id, Lote object) {
  object.id = id;
  object.storage.attach(col, col.isar.collection<Storage>(), r'storage', id);
  object.product.attach(col, col.isar.collection<Product>(), r'product', id);
}

extension LoteByIndex on IsarCollection<Lote> {
  Future<Lote?> getByLoteUID(String loteUID) {
    return getByIndex(r'loteUID', [loteUID]);
  }

  Lote? getByLoteUIDSync(String loteUID) {
    return getByIndexSync(r'loteUID', [loteUID]);
  }

  Future<bool> deleteByLoteUID(String loteUID) {
    return deleteByIndex(r'loteUID', [loteUID]);
  }

  bool deleteByLoteUIDSync(String loteUID) {
    return deleteByIndexSync(r'loteUID', [loteUID]);
  }

  Future<List<Lote?>> getAllByLoteUID(List<String> loteUIDValues) {
    final values = loteUIDValues.map((e) => [e]).toList();
    return getAllByIndex(r'loteUID', values);
  }

  List<Lote?> getAllByLoteUIDSync(List<String> loteUIDValues) {
    final values = loteUIDValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'loteUID', values);
  }

  Future<int> deleteAllByLoteUID(List<String> loteUIDValues) {
    final values = loteUIDValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'loteUID', values);
  }

  int deleteAllByLoteUIDSync(List<String> loteUIDValues) {
    final values = loteUIDValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'loteUID', values);
  }

  Future<Id> putByLoteUID(Lote object) {
    return putByIndex(r'loteUID', object);
  }

  Id putByLoteUIDSync(Lote object, {bool saveLinks = true}) {
    return putByIndexSync(r'loteUID', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLoteUID(List<Lote> objects) {
    return putAllByIndex(r'loteUID', objects);
  }

  List<Id> putAllByLoteUIDSync(List<Lote> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'loteUID', objects, saveLinks: saveLinks);
  }
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

  QueryBuilder<Lote, Lote, QAfterWhereClause> loteUIDEqualTo(String loteUID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'loteUID',
        value: [loteUID],
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterWhereClause> loteUIDNotEqualTo(
      String loteUID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'loteUID',
              lower: [],
              upper: [loteUID],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'loteUID',
              lower: [loteUID],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'loteUID',
              lower: [loteUID],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'loteUID',
              lower: [],
              upper: [loteUID],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LoteQueryFilter on QueryBuilder<Lote, Lote, QFilterCondition> {
  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateExpirationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateExpiration',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateExpirationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateExpiration',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateExpirationEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateExpiration',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateExpirationGreaterThan(
    DateTime? value, {
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
    DateTime? value, {
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
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateManufactureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateManufacture',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateManufactureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateManufacture',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateManufactureEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateManufacture',
        value: value,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> dateManufactureGreaterThan(
    DateTime? value, {
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
    DateTime? value, {
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
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quantity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: '',
      ));
    });
  }

  QueryBuilder<Lote, Lote, QAfterFilterCondition> quantityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quantity',
        value: '',
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
}

extension LoteQuerySortBy on QueryBuilder<Lote, Lote, QSortBy> {
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

  QueryBuilder<Lote, Lote, QDistinct> distinctByQuantity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity', caseSensitive: caseSensitive);
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

  QueryBuilder<Lote, DateTime?, QQueryOperations> dateExpirationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateExpiration');
    });
  }

  QueryBuilder<Lote, DateTime?, QQueryOperations> dateManufactureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateManufacture');
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

  QueryBuilder<Lote, String, QQueryOperations> quantityProperty() {
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