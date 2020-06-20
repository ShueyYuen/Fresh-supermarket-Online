import 'package:json_annotation/json_annotation.dart';

part 'amapgeo.g.dart';

@JsonSerializable()
class Amapgeo {
    Amapgeo();

    String province;
    String city;
    String district;
    String township;
    String street;
    String no;
    num longitude;
    num latitude;
    
    factory Amapgeo.fromJson(Map<String,dynamic> json) => _$AmapgeoFromJson(json);
    Map<String, dynamic> toJson() => _$AmapgeoToJson(this);
}
