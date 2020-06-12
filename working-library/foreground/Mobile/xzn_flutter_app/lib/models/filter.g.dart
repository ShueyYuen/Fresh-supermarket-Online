// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) {
  return Filter()
    ..min = json['min'] as num
    ..max = json['max'] as num
    ..tag = (json['tag'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'tag': instance.tag
    };
