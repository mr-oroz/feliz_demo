// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationModel<T> _$PaginationModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PaginationModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PaginationModel<T> {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<T> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationModelCopyWith<T, PaginationModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<T, $Res> {
  factory $PaginationModelCopyWith(
          PaginationModel<T> value, $Res Function(PaginationModel<T>) then) =
      _$PaginationModelCopyWithImpl<T, $Res, PaginationModel<T>>;
  @useResult
  $Res call({int count, String? next, String? previous, List<T> results});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<T, $Res, $Val extends PaginationModel<T>>
    implements $PaginationModelCopyWith<T, $Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationModelImplCopyWith<T, $Res>
    implements $PaginationModelCopyWith<T, $Res> {
  factory _$$PaginationModelImplCopyWith(_$PaginationModelImpl<T> value,
          $Res Function(_$PaginationModelImpl<T>) then) =
      __$$PaginationModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int count, String? next, String? previous, List<T> results});
}

/// @nodoc
class __$$PaginationModelImplCopyWithImpl<T, $Res>
    extends _$PaginationModelCopyWithImpl<T, $Res, _$PaginationModelImpl<T>>
    implements _$$PaginationModelImplCopyWith<T, $Res> {
  __$$PaginationModelImplCopyWithImpl(_$PaginationModelImpl<T> _value,
      $Res Function(_$PaginationModelImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginationModelImpl<T>(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PaginationModelImpl<T> implements _PaginationModel<T> {
  const _$PaginationModelImpl(
      {this.count = 0,
      this.next,
      this.previous,
      required final List<T> results})
      : _results = results;

  factory _$PaginationModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PaginationModelImplFromJson(json, fromJsonT);

  @override
  @JsonKey()
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<T> _results;
  @override
  List<T> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginationModel<$T>(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationModelImpl<T> &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationModelImplCopyWith<T, _$PaginationModelImpl<T>> get copyWith =>
      __$$PaginationModelImplCopyWithImpl<T, _$PaginationModelImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PaginationModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _PaginationModel<T> implements PaginationModel<T> {
  const factory _PaginationModel(
      {final int count,
      final String? next,
      final String? previous,
      required final List<T> results}) = _$PaginationModelImpl<T>;

  factory _PaginationModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PaginationModelImpl<T>.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<T> get results;
  @override
  @JsonKey(ignore: true)
  _$$PaginationModelImplCopyWith<T, _$PaginationModelImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
