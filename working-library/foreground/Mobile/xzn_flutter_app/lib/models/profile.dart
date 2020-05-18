import 'package:json_annotation/json_annotation.dart';
import "user.dart";
import "myOrder.dart";
part 'profile.g.dart';

@JsonSerializable()
class Profile {
    Profile();

    User user;
    MyOrder my_order;
    List cart;
    String token;
    
    factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
    Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
