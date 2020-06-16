// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amapNearItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmapNearItem _$AmapNearItemFromJson(Map<String, dynamic> json) {
  return AmapNearItem()
    ..formatted_address = json['formatted_address'] as String
    ..addressComponent = json['addressComponent'] as Map<String, dynamic>
    ..pois = json['pois'] as List
    ..roads = json['roads'] as List
    ..roadinters = json['roadinters'] as List
    ..aois = json['aois'] as List;
}

Map<String, dynamic> _$AmapNearItemToJson(AmapNearItem instance) =>
    <String, dynamic>{
      'formatted_address': instance.formatted_address,
      'addressComponent': instance.addressComponent,
      'pois': instance.pois,
      'roads': instance.roads,
      'roadinters': instance.roadinters,
      'aois': instance.aois
    };
