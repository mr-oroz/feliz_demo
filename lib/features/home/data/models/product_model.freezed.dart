// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String get category => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'preparation_minutes')
  String get preparationMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'modifiers_count')
  int? get modifiersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_sizes')
  bool get hasSizes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'display_name') String name,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'category_id') String category,
      double? price,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? description,
      @JsonKey(name: 'preparation_minutes') String preparationMinutes,
      @JsonKey(name: 'sort_order') int sortOrder,
      @JsonKey(name: 'modifiers_count') int? modifiersCount,
      @JsonKey(name: 'has_sizes') bool hasSizes});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryName = null,
    Object? category = null,
    Object? price = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? preparationMinutes = null,
    Object? sortOrder = null,
    Object? modifiersCount = freezed,
    Object? hasSizes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      preparationMinutes: null == preparationMinutes
          ? _value.preparationMinutes
          : preparationMinutes // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      modifiersCount: freezed == modifiersCount
          ? _value.modifiersCount
          : modifiersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      hasSizes: null == hasSizes
          ? _value.hasSizes
          : hasSizes // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'display_name') String name,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'category_id') String category,
      double? price,
      @JsonKey(name: 'image_url') String? imageUrl,
      String? description,
      @JsonKey(name: 'preparation_minutes') String preparationMinutes,
      @JsonKey(name: 'sort_order') int sortOrder,
      @JsonKey(name: 'modifiers_count') int? modifiersCount,
      @JsonKey(name: 'has_sizes') bool hasSizes});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryName = null,
    Object? category = null,
    Object? price = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
    Object? preparationMinutes = null,
    Object? sortOrder = null,
    Object? modifiersCount = freezed,
    Object? hasSizes = null,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      preparationMinutes: null == preparationMinutes
          ? _value.preparationMinutes
          : preparationMinutes // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      modifiersCount: freezed == modifiersCount
          ? _value.modifiersCount
          : modifiersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      hasSizes: null == hasSizes
          ? _value.hasSizes
          : hasSizes // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {required this.id,
      @JsonKey(name: 'display_name') required this.name,
      @JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'category_id') required this.category,
      this.price,
      @JsonKey(name: 'image_url') this.imageUrl,
      this.description,
      @JsonKey(name: 'preparation_minutes') required this.preparationMinutes,
      @JsonKey(name: 'sort_order') required this.sortOrder,
      @JsonKey(name: 'modifiers_count') this.modifiersCount,
      @JsonKey(name: 'has_sizes') required this.hasSizes});

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'display_name')
  final String name;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'category_id')
  final String category;
  @override
  final double? price;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  final String? description;
  @override
  @JsonKey(name: 'preparation_minutes')
  final String preparationMinutes;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  @override
  @JsonKey(name: 'modifiers_count')
  final int? modifiersCount;
  @override
  @JsonKey(name: 'has_sizes')
  final bool hasSizes;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, categoryName: $categoryName, category: $category, price: $price, imageUrl: $imageUrl, description: $description, preparationMinutes: $preparationMinutes, sortOrder: $sortOrder, modifiersCount: $modifiersCount, hasSizes: $hasSizes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.preparationMinutes, preparationMinutes) ||
                other.preparationMinutes == preparationMinutes) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.modifiersCount, modifiersCount) ||
                other.modifiersCount == modifiersCount) &&
            (identical(other.hasSizes, hasSizes) ||
                other.hasSizes == hasSizes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      categoryName,
      category,
      price,
      imageUrl,
      description,
      preparationMinutes,
      sortOrder,
      modifiersCount,
      hasSizes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
          {required final String id,
          @JsonKey(name: 'display_name') required final String name,
          @JsonKey(name: 'category_name') required final String categoryName,
          @JsonKey(name: 'category_id') required final String category,
          final double? price,
          @JsonKey(name: 'image_url') final String? imageUrl,
          final String? description,
          @JsonKey(name: 'preparation_minutes')
          required final String preparationMinutes,
          @JsonKey(name: 'sort_order') required final int sortOrder,
          @JsonKey(name: 'modifiers_count') final int? modifiersCount,
          @JsonKey(name: 'has_sizes') required final bool hasSizes}) =
      _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'display_name')
  String get name;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'category_id')
  String get category;
  @override
  double? get price;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  String? get description;
  @override
  @JsonKey(name: 'preparation_minutes')
  String get preparationMinutes;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  @JsonKey(name: 'modifiers_count')
  int? get modifiersCount;
  @override
  @JsonKey(name: 'has_sizes')
  bool get hasSizes;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
