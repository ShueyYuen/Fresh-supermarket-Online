import 'package:json_annotation/json_annotation.dart';

part 'deliveryman.g.dart';

@JsonSerializable()
class Deliveryman {
    Deliveryman();

    num deliveryman_id;
    String name;
    String phone;
    String sex;
    num longitude;
    num latitude;
    String status;
    
    factory Deliveryman.fromJson(Map<String,dynamic> json) => _$DeliverymanFromJson(json);
    Map<String, dynamic> toJson() => _$DeliverymanToJson(this);
}
