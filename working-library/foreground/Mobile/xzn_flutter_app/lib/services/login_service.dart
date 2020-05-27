import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xzn/models/index.dart';
import 'package:provider/provider.dart';

import '../conf/config.dart';
import '../models/messageCode.dart';
import '../states/profile_change_notifier.dart';

getMessage_code(String phone) async {
  String url = Config.baseUrl()+"user/code";
  print(phone);
  var res = await http.post(url, body: {
    "phone": phone
  });
  var json = jsonDecode(res.body);
  return  MessageCode.fromJson(json);
}

Login(BuildContext context, String phone, {String code = "", String password = ""}) async {
  String url = Config.baseUrl()+"user/login";
  var body = code.length == 0 ? {
    "phone": phone,
    "password": password
  }: {
    "phone": phone,
    "code": code
  };
  var user = User();
  var res = await http.post(url, body: body);
  var json = jsonDecode(res.body);
  try {
    user = User.fromJson(json);
    // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
    Provider.of<UserModel>(context, listen: false).user = user;
  } catch (e) {
    print(e.toString());
  } finally {
    Navigator.of(context).pop();
  }
  if (user != null) {
    // 返回
    Navigator.of(context).pop();
  }
  return User.fromJson(json);
}