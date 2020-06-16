import 'package:json_annotation/json_annotation.dart';

part 'ads.g.dart';

@JsonSerializable()
class Ads {
    Ads();

    String type;
    String data;
    String picture;
    
    factory Ads.fromJson(Map<String,dynamic> json) => _$AdsFromJson(json);
    Map<String, dynamic> toJson() => _$AdsToJson(this);
}
