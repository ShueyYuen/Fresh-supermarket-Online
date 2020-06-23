import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/index.dart';
import 'package:xzn/models/ads.dart';
import 'package:xzn/services/token.dart';

getAdsList(BuildContext context) async {
  List<Ads> ads_list = List<Ads>();
  String url = Config.baseUrl() + "user/ads";
  var dio = new Dio();
  var body = {"token": getToken(context)};
  FormData formData = new FormData.fromMap(body);
  var res = await dio.post(url, data: formData);
  var json = jsonDecode(res.data.toString());
  for (var item in json) {
    try {
      ads_list.add(Ads.fromJson(item));
    } catch (e) {
      print(e.toString());
    } finally {}
  }
  return ads_list;
}
