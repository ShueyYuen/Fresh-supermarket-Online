import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
    Product();

    String product_name;
    String product_id;
    Map<String,dynamic> price;
    Map<String,dynamic> picture_list;
    Map<String,dynamic> details;
    num stock;
    num discount;
    Map<String,dynamic> description;
    Map<String,dynamic> tags;
    
    factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
    Map<String, dynamic> toJson() => _$ProductToJson(this);
}
