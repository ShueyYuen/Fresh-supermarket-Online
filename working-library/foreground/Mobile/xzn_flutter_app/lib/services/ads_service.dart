import 'dart:convert';

import 'package:xzn/conf/config.dart';
import 'package:http/http.dart' as http;
import 'package:xzn/models/ads.dart';

getAdsList(String token) async {
  String url = Config.baseUrl() + "user/ads";
  List<Ads> ads_list = List<Ads>();
  var body = {"token": token};
  var res = await http.post(url, body: body);
  var json = jsonDecode(res.body);
  for (var item in json) {
    try {
      ads_list.add(Ads.fromJson(item));
    } catch (e) {
      print(e.toString());
    } finally {}
  }
  return ads_list;
}