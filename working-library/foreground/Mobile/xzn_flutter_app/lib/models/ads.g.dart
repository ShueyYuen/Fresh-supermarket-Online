// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ads _$AdsFromJson(Map<String, dynamic> json) {
  return Ads()
    ..type = json['type'] as String
    ..data = json['data'] as String
    ..picture = json['picture'] as String;
}

Map<String, dynamic> _$AdsToJson(Ads instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'picture': instance.picture
    };
