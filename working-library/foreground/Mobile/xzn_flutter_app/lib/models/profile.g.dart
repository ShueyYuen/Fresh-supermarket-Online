// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile()
    ..first_load = json['first_load'] as bool
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..my_order = json['my_order'] == null
        ? null
        : MyOrder.fromJson(json['my_order'] as Map<String, dynamic>)
    ..cart = (json['cart'] as List)
        ?.map((e) =>
            e == null ? null : CartItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..address = (json['address'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..order = (json['order'] as List)
        ?.map(
            (e) => e == null ? null : Order.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..token = json['token'] as String;
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'first_load': instance.first_load,
      'user': instance.user,
      'my_order': instance.my_order,
      'cart': instance.cart,
      'address': instance.address,
      'order': instance.order,
      'token': instance.token
    };
