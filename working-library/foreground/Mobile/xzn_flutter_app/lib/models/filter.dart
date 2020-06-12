import 'package:json_annotation/json_annotation.dart';

part 'filter.g.dart';

@JsonSerializable()
class Filter {
    Filter();

    num min;
    num max;
    List<String> tag;
    
    factory Filter.fromJson(Map<String,dynamic> json) => _$FilterFromJson(json);
    Map<String, dynamic> toJson() => _$FilterToJson(this);
}
