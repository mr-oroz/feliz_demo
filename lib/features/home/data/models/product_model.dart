import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    @JsonKey(name: 'display_name') required String name,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'category_id') required String category,
    final double? price,
    @JsonKey(name: 'image_url') String? imageUrl,
    String? description,
    @JsonKey(name: 'preparation_minutes') required String preparationMinutes,
    @JsonKey(name: 'sort_order') required int sortOrder,
    @JsonKey(name: 'modifiers_count') int? modifiersCount,
    @JsonKey(name: 'has_sizes') required bool hasSizes,

  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
