import 'package:json_annotation/json_annotation.dart';

part 'errorMessage.g.dart';

@JsonSerializable()
class ErrorMessage {
    ErrorMessage();

    String message;
    
    factory ErrorMessage.fromJson(Map<String,dynamic> json) => _$ErrorMessageFromJson(json);
    Map<String, dynamic> toJson() => _$ErrorMessageToJson(this);
}
