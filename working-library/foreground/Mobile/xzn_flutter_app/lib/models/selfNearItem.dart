import 'package:json_annotation/json_annotation.dart';

part 'selfNearItem.g.dart';

@JsonSerializable()
class SelfNearItem {
    SelfNearItem();

    String province;
    String city;
    String district;
    String township;
    String build;
    num longitude;
    num latitude;
    
    factory SelfNearItem.fromJson(Map<String,dynamic> json) => _$SelfNearItemFromJson(json);
    Map<String, dynamic> toJson() => _$SelfNearItemToJson(this);
}
