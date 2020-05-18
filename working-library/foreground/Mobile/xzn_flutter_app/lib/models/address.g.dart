// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address()
    ..address_id = json['address_id'] as String
    ..person = json['person'] as Map<String, dynamic>
    ..phone = json['phone'] as String
    ..detail = json['detail'] as Map<String, dynamic>
    ..longitude = json['longitude'] as num
    ..latitude = json['latitude'] as num
    ..tag = json['tag'] as String;
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'address_id': instance.address_id,
      'person': instance.person,
      'phone': instance.phone,
      'detail': instance.detail,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'tag': instance.tag
    };
