// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliveryman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deliveryman _$DeliverymanFromJson(Map<String, dynamic> json) {
  return Deliveryman()
    ..deliveryman_id = json['deliveryman_id'] as String
    ..name = json['name'] as String
    ..phone = json['phone'] as String
    ..sex = json['sex'] as String
    ..longitude = json['longitude'] as num
    ..latitude = json['latitude'] as num
    ..status = json['status'] as num;
}

Map<String, dynamic> _$DeliverymanToJson(Deliveryman instance) =>
    <String, dynamic>{
      'deliveryman_id': instance.deliveryman_id,
      'name': instance.name,
      'phone': instance.phone,
      'sex': instance.sex,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'status': instance.status
    };
