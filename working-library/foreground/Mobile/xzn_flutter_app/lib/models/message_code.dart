import 'package:json_annotation/json_annotation.dart';

part 'message_code.g.dart';

@JsonSerializable()
class Message_code {
    Message_code();

    String code;
    
    factory Message_code.fromJson(Map<String,dynamic> json) => _$Message_codeFromJson(json);
    Map<String, dynamic> toJson() => _$Message_codeToJson(this);
}
