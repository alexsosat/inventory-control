// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_presentation.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetProductPresentationCollection on Isar {
  IsarCollection<ProductPresentation> get productPresentations =>
      this.collection();
}

const ProductPresentationSchema = CollectionSchema(
  name: r'ProductPresentation',
  id: -2040601489287142537,
  properties: {
    r'fullString': PropertySchema(
      id: 0,
      name: r'fullString',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 1,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'unit': PropertySchema(
      id: 3,
      name: r'unit',
      type: IsarType.byte,
      enumMap: _ProductPresentationunitEnumValueMap,
    )
  },
  estimateSize: _productPresentationEstimateSize,
  serialize: _productPresentationSerialize,
  deserialize: _productPresentationDeserialize,
  deserializeProp: _productPresentationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _productPresentationGetId,
  getLinks: _productPresentationGetLinks,
  attach: _productPresentationAttach,
  version: '3.0.5',
);

int _productPresentationEstimateSize(
  ProductPresentation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fullString.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _productPresentationSerialize(
  ProductPresentation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fullString);
  writer.writeLong(offsets[1], object.hashCode);
  writer.writeString(offsets[2], object.name);
  writer.writeByte(offsets[3], object.unit.index);
}

ProductPresentation _productPresentationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductPresentation(
    name: reader.readString(offsets[2]),
    unit: _ProductPresentationunitValueEnumMap[
            reader.readByteOrNull(offsets[3])] ??
        MeasureUnit.kg,
  );
  object.id = id;
  return object;
}

P _productPresentationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_ProductPresentationunitValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MeasureUnit.kg) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProductPresentationunitEnumValueMap = {
  'kg': 0,
  'g': 1,
  'l': 2,
  'ml': 3,
};
const _ProductPresentationunitValueEnumMap = {
  0: MeasureUnit.kg,
  1: MeasureUnit.g,
  2: MeasureUnit.l,
  3: MeasureUnit.ml,
};

Id _productPresentationGetId(ProductPresentation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productPresentationGetLinks(
    ProductPresentation object) {
  return [];
}

void _productPresentationAttach(
    IsarCollection<dynamic> col, Id id, ProductPresentation object) {
  object.id = id;
}

extension ProductPresentationQueryWhereSort
    on QueryBuilder<ProductPresentation, ProductPresentation, QWhere> {
  QueryBuilder<ProductPresentation, ProductPresentation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductPresentationQueryWhere
    on QueryBuilder<ProductPresentation, ProductPresentation, QWhereClause> {
  QueryBuilder<ProductPresentation, ProductPresentation, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterWhereClause>
      idBetween(
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

extension ProductPresentationQueryFilter on QueryBuilder<ProductPresentation,
    ProductPresentation, QFilterCondition> {
  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      fullStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      fullStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      fullStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      fullStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      fullStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      fullStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      fullStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      fullStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      fullStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullString',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      fullStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullString',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      hashCodeGreaterThan(
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

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      hashCodeLessThan(
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

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      hashCodeBetween(
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

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      unitEqualTo(MeasureUnit value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      unitGreaterThan(
    MeasureUnit value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      unitLessThan(
    MeasureUnit value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterFilterCondition>
      unitBetween(
    MeasureUnit lower,
    MeasureUnit upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductPresentationQueryObject on QueryBuilder<ProductPresentation,
    ProductPresentation, QFilterCondition> {}

extension ProductPresentationQueryLinks on QueryBuilder<ProductPresentation,
    ProductPresentation, QFilterCondition> {}

extension ProductPresentationQuerySortBy
    on QueryBuilder<ProductPresentation, ProductPresentation, QSortBy> {
  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      sortByFullString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullString', Sort.asc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      sortByFullStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullString', Sort.desc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension ProductPresentationQuerySortThenBy
    on QueryBuilder<ProductPresentation, ProductPresentation, QSortThenBy> {
  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      thenByFullString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullString', Sort.asc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      thenByFullStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullString', Sort.desc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension ProductPresentationQueryWhereDistinct
    on QueryBuilder<ProductPresentation, ProductPresentation, QDistinct> {
  QueryBuilder<ProductPresentation, ProductPresentation, QDistinct>
      distinctByFullString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullString', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductPresentation, ProductPresentation, QDistinct>
      distinctByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit');
    });
  }
}

extension ProductPresentationQueryProperty
    on QueryBuilder<ProductPresentation, ProductPresentation, QQueryProperty> {
  QueryBuilder<ProductPresentation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductPresentation, String, QQueryOperations>
      fullStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullString');
    });
  }

  QueryBuilder<ProductPresentation, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<ProductPresentation, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ProductPresentation, MeasureUnit, QQueryOperations>
      unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}
