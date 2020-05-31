import 'package:json_annotation/json_annotation.dart';
import "user.dart";
import "myOrder.dart";
import "cartItem.dart";
import "address.dart";
import "order.dart";
part 'profile.g.dart';

@JsonSerializable()
class Profile {
    Profile();

    User user;
    MyOrder my_order;
    List<CartItem> cart;
    List<Address> address;
    List<Order> order;
    String token;
    
    factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
    Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
