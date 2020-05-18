// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem()
    ..product = json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>)
    ..number = json['number'] as num;
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) =>
    <String, dynamic>{'product': instance.product, 'number': instance.number};
