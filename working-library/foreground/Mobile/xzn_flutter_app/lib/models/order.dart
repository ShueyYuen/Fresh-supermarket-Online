import 'package:json_annotation/json_annotation.dart';
import "customer.dart";
import "address.dart";
import "cartItem.dart";
import "deliveryman.dart";
part 'order.g.dart';

@JsonSerializable()
class Order {
    Order();

    num order_id;
    Customer customer;
    Address address;
    List<CartItem> product_list;
    Deliveryman deliveryman;
    String create_order_time;
    String receive_order_time;
    String finish_order_time;
    num order_status;
    String payment_id;
    String note;
    num total_price;
    
    factory Order.fromJson(Map<String,dynamic> json) => _$OrderFromJson(json);
    Map<String, dynamic> toJson() => _$OrderToJson(this);
}
