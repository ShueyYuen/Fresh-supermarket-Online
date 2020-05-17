// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..userId = json['userId'] as String
    ..nikename = json['nikename'] as String
    ..token = json['token'] as String
    ..avatarId = json['avatarId'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'nikename': instance.nikename,
      'token': instance.token,
      'avatarId': instance.avatarId
    };
