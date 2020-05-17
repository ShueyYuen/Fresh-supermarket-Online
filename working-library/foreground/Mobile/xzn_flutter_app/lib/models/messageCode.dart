import 'package:json_annotation/json_annotation.dart';

part 'messageCode.g.dart';

@JsonSerializable()
class MessageCode {
    MessageCode();

    String code;
    
    factory MessageCode.fromJson(Map<String,dynamic> json) => _$MessageCodeFromJson(json);
    Map<String, dynamic> toJson() => _$MessageCodeToJson(this);
}
