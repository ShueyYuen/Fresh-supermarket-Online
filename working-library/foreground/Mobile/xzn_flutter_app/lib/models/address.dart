import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
    Address();

    int address_id;
    Map<String,dynamic> person;
    String phone;
    Map<String,dynamic> detail;
    double longitude;
    double latitude;
    String tag;
    
    factory Address.fromJson(Map<String,dynamic> json) => _$AddressFromJson(json);
    Map<String, dynamic> toJson() => _$AddressToJson(this);
}
