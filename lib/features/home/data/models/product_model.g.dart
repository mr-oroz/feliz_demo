// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String,
      name: json['display_name'] as String,
      categoryName: json['category_name'] as String,
      category: json['category_id'] as String,
      price: (json['price'] as num?)?.toDouble(),
      imageUrl: json['image_url'] as String?,
      description: json['description'] as String?,
      preparationMinutes: json['preparation_minutes'] as String,
      sortOrder: (json['sort_order'] as num).toInt(),
      modifiersCount: (json['modifiers_count'] as num?)?.toInt(),
      hasSizes: json['has_sizes'] as bool,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.name,
      'category_name': instance.categoryName,
      'category_id': instance.category,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'description': instance.description,
      'preparation_minutes': instance.preparationMinutes,
      'sort_order': instance.sortOrder,
      'modifiers_count': instance.modifiersCount,
      'has_sizes': instance.hasSizes,
    };
