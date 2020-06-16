import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:xzn/models/user.dart';
import 'package:xzn/services/logout_service.dart';

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
  } catch (e) {
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
  User user;
  var response = await dio.post(url, data: formData);
  var json = jsonDecode(response.data.toString());
  print(response.data.toString());
  try {
    user = User.fromJson(json);
    if (null == user.token) throw Exception("");
    // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
    Provider.of<UserModel>(context).user = user;
    return User.fromJson(json);
  } catch (e) {
    Logout(context);
    var snackBar = SnackBar(
      backgroundColor: Color.fromARGB(100, 250, 0, 0),
      duration: Duration(seconds: 5),
      elevation: 0,
      content: Row(
        children: <Widget>[
          Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Text(json["message"])
        ],
      ),
      behavior: SnackBarBehavior.floating,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  } finally {
    if (null != user.user_id) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
  }
}
