import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
    Customer();

    String phone;
    String sex;
    String nickname;
    
    factory Customer.fromJson(Map<String,dynamic> json) => _$CustomerFromJson(json);
    Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
