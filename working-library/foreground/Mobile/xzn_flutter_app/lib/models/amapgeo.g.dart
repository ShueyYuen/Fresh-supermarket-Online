// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amapgeo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Amapgeo _$AmapgeoFromJson(Map<String, dynamic> json) {
  return Amapgeo()
    ..province = json['province'] as String
    ..city = json['city'] as String
    ..district = json['district'] as String
    ..township = json['township'] as String
    ..street = json['street'] as String
    ..no = json['no'] as String
    ..longitude = json['longitude'] as num
    ..latitude = json['latitude'] as num;
}

Map<String, dynamic> _$AmapgeoToJson(Amapgeo instance) => <String, dynamic>{
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'township': instance.township,
      'street': instance.street,
      'no': instance.no,
      'longitude': instance.longitude,
      'latitude': instance.latitude
    };
