import 'package:json_annotation/json_annotation.dart';

part 'myOrder.g.dart';

@JsonSerializable()
class MyOrder {
    MyOrder();

    num unpaid;
    num unsend;
    num unreceived;
    num unevaluated;
    
    factory MyOrder.fromJson(Map<String,dynamic> json) => _$MyOrderFromJson(json);
    Map<String, dynamic> toJson() => _$MyOrderToJson(this);
}
