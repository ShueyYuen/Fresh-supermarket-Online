// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selfNearItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfNearItem _$SelfNearItemFromJson(Map<String, dynamic> json) {
  return SelfNearItem()
    ..province = json['province'] as String
    ..city = json['city'] as String
    ..district = json['district'] as String
    ..township = json['township'] as String
    ..build = json['build'] as String;
}

Map<String, dynamic> _$SelfNearItemToJson(SelfNearItem instance) =>
    <String, dynamic>{
      'province': instance.province,
      'city': instance.city,
      'district': instance.district,
      'township': instance.township,
      'build': instance.build
    };
