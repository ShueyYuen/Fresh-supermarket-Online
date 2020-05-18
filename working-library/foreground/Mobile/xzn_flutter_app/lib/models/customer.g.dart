// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer()
    ..phone = json['phone'] as String
    ..sex = json['sex'] as String
    ..nickname = json['nickname'] as String;
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'phone': instance.phone,
      'sex': instance.sex,
      'nickname': instance.nickname
    };
