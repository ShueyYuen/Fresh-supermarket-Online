// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address()
    ..address_id = json['address_id'] as num
    ..person = json['person'] as Map<String, dynamic>
    ..phone = json['phone'] as String
    ..detail = json['detail'] == null
        ? null
        : Amapgeo.fromJson(json['detail'] as Map<String, dynamic>)
    ..tag = json['tag'] as String;
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address_id': instance.address_id,
      'person': instance.person,
      'phone': instance.phone,
      'detail': instance.detail,
      'tag': instance.tag
    };
