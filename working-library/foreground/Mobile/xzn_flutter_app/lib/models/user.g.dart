// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..phone = json['phone'] as String
    ..sex = json['sex'] as String
    ..user_id = json['user_id'] as String
    ..nickname = json['nickname'] as String
    ..token = json['token'] as String
    ..head_image_id = json['head_image_id'] as String
    ..money = json['money'] as num;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'phone': instance.phone,
      'sex': instance.sex,
      'user_id': instance.user_id,
      'nickname': instance.nickname,
      'token': instance.token,
      'head_image_id': instance.head_image_id,
      'money': instance.money
    };
