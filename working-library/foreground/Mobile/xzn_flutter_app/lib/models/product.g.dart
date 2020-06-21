// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product()
    ..product_name = json['product_name'] as String
    ..product_id = json['product_id'] as String
    ..price = json['price'] as Map<String, dynamic>
    ..picture_list = json['picture_list'] as Map<String, dynamic>
    ..details = json['details'] as Map<String, dynamic>
    ..stock = json['stock'] as num
    ..discount = json['discount'] as num
    ..description = json['description'] as Map<String, dynamic>
    ..tags = json['tags'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'product_name': instance.product_name,
      'product_id': instance.product_id,
      'price': instance.price,
      'picture_list': instance.picture_list,
      'details': instance.details,
      'stock': instance.stock,
      'discount': instance.discount,
      'description': instance.description,
      'tags': instance.tags
    };
