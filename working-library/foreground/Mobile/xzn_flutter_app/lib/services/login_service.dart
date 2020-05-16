import 'package:http/http.dart' as http;
import 'dart:convert';

import '../conf/config.dart';
import '../models/message_code.dart';

getMessageCode() async {
  String url = Config.baseUrl()+"user/code";
  var res = await http.post(url);
  var json = jsonDecode(res.body);
  return  Message_code.fromJson(json);
}