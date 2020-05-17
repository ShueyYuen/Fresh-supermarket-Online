// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myOrder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrder _$MyOrderFromJson(Map<String, dynamic> json) {
  return MyOrder()
    ..unpaid = json['unpaid'] as num
    ..unsend = json['unsend'] as num
    ..unreceived = json['unreceived'] as num
    ..unevaluated = json['unevaluated'] as num;
}

Map<String, dynamic> _$MyOrderToJson(MyOrder instance) => <String, dynamic>{
      'unpaid': instance.unpaid,
      'unsend': instance.unsend,
      'unreceived': instance.unreceived,
      'unevaluated': instance.unevaluated
    };
