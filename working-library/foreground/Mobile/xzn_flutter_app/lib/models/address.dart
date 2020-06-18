import 'package:json_annotation/json_annotation.dart';
import "amapgeo.dart";
part 'address.g.dart';

@JsonSerializable()
class Address {
    Address();

    num address_id;
    Map<String,dynamic> person;
    String phone;
    Amapgeo detail;
    String tag;
    
    factory Address.fromJson(Map<String,dynamic> json) => _$AddressFromJson(json);
    Map<String, dynamic> toJson() => _$AddressToJson(this);
}
