// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order()
    ..order_id = json['order_id'] as String
    ..customer = json['customer'] == null
        ? null
        : Customer.fromJson(json['customer'] as Map<String, dynamic>)
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>)
    ..product_list = (json['product_list'] as List)
        ?.map((e) =>
            e == null ? null : CartItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..deliveryman = json['deliveryman'] == null
        ? null
        : Deliveryman.fromJson(json['deliveryman'] as Map<String, dynamic>)
    ..create_order_time = json['create_order_time'] as String
    ..receive_order_time = json['receive_order_time'] as String
    ..finish_order_time = json['finish_order_time'] as String
    ..order_status = json['order_status'] as String
    ..payment_id = json['payment_id'] as String
    ..note = json['note'] as String
    ..total_price = json['total_price'] as num;
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'order_id': instance.order_id,
      'customer': instance.customer,
      'address': instance.address,
      'product_list': instance.product_list,
      'deliveryman': instance.deliveryman,
      'create_order_time': instance.create_order_time,
      'receive_order_time': instance.receive_order_time,
      'finish_order_time': instance.finish_order_time,
      'order_status': instance.order_status,
      'payment_id': instance.payment_id,
      'note': instance.note,
      'total_price': instance.total_price
    };
