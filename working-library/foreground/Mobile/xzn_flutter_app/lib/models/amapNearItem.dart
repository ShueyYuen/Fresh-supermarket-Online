import 'package:json_annotation/json_annotation.dart';

part 'amapNearItem.g.dart';

@JsonSerializable()
class AmapNearItem {
    AmapNearItem();

    String formatted_address;
    Map<String,dynamic> addressComponent;
    List pois;
    List roads;
    List roadinters;
    List aois;
    
    factory AmapNearItem.fromJson(Map<String,dynamic> json) => _$AmapNearItemFromJson(json);
    Map<String, dynamic> toJson() => _$AmapNearItemToJson(this);
}
