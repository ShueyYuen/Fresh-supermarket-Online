import 'package:json_annotation/json_annotation.dart';
import "customer.dart";
import "address.dart";
import "deliveryman.dart";
part 'order.g.dart';

@JsonSerializable()
class Order {
    Order();

    String order_id;
    Customer customer;
    Address address;
    List product_list;
    Deliveryman deliveryman;
    String create_order_time;
    String receive_order_time;
    String finish_order_time;
    String order_status;
    String payment_id;
    String note;
    num total_price;
    
    factory Order.fromJson(Map<String,dynamic> json) => _$OrderFromJson(json);
    Map<String, dynamic> toJson() => _$OrderToJson(this);
}
