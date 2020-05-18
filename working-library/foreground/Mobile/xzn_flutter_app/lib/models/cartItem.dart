import 'package:json_annotation/json_annotation.dart';
import "product.dart";
part 'cartItem.g.dart';

@JsonSerializable()
class CartItem {
    CartItem();

    Product product;
    num number;
    
    factory CartItem.fromJson(Map<String,dynamic> json) => _$CartItemFromJson(json);
    Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
