import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:xzn/models/user.dart';
import 'package:http/http.dart' as http;

import '../conf/config.dart';
import '../models/messageCode.dart';
import '../states/profile_change_notifier.dart';

getMessage_code(String phone) async {
  String url = Config.baseUrl() + "user/code";
  var dio = new Dio();
  var json = null;
  FormData formData = new FormData.fromMap({"phone": phone});
  var response = await dio.post(url, data: formData);
  try {
    json = jsonDecode(response.data.toString());
  }
  catch (e) {
    print(response.data.toString());
  }
  return MessageCode.fromJson(json);
}

Login(BuildContext context, String phone,
    {String code = "", String password = ""}) async {
  String url = Config.baseUrl() + "user/login";
  var dio = new Dio();
  FormData formData = new FormData.fromMap(code.length == 0
      ? {"phone": phone, "password": password}
      : {"phone": phone, "code": code});
  print(formData.fields);
  var user = User();
  var response = await dio.post(url, data: formData);
  print(response);
  var json = jsonDecode(response.data.toString());
  try {
    user = User.fromJson(json);
    // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
    Provider.of<UserModel>(context, listen: false).user = user;
  } catch (e) {
    print("error:");
    print(response);
    print(e.toString());

  } finally {
    Navigator.of(context).pop();
  }
  if (user != null) {
    Navigator.of(context).pop();
  }
  return User.fromJson(json);
}
