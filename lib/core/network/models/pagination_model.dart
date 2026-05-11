import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';


@Freezed(genericArgumentFactories: true)
abstract class PaginationModel<T> with _$PaginationModel<T> {
  const factory PaginationModel({
    @Default(0) int count,
    final String? next,
    final String? previous,
    required List<T> results,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(
      Map<String, dynamic> json,
      T Function(Object?) fromJsonT,
      ) => _$PaginationModelFromJson(json, fromJsonT);
}
