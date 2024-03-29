import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/models/user.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/states/profile_change_notifier.dart';

updateInformation(BuildContext context, {
  nickname: "", sex: "", password: "", original_password: ""
}) async {
  try {
//    if (!Provider.of<OrderModel>(context, listen: false).is_loaded &&
//        Provider.of<UserModel>(context, listen: false).isLogin) {
    if (Provider.of<UserModel>(context, listen: false).isLogin) {
      User user = Provider.of<UserModel>(context, listen: false).user;
      String url = Config.baseUrl() + "user/info/set";
      var dio = new Dio();
      Map<String, dynamic> data = {"token": getToken(context)};
      print(data["token"]);
      if(nickname != "" && nickname != user.nickname) data["nickname"] = nickname;
      if(sex != "" && sex != user.sex) data["sex"] = sex;
      if(password != "" && original_password != "") {
        data["original_password"] = original_password;
        data["password"] = password;
      }
      if (data.keys.length != 1) {
        FormData formData = new FormData.fromMap(data);
        var response = await dio.post(url, data: formData);
        var json = jsonDecode(response.data.toString());
        print(json);
        if (json["success"]) return true;
      }
    }
  } catch (e) {
    print(e.toString());
  }
  return false;
}

getInformation(BuildContext context) async {
  try {
//    if (!Provider.of<OrderModel>(context, listen: false).is_loaded &&
//        Provider.of<UserModel>(context, listen: false).isLogin) {
    if (Provider.of<UserModel>(context, listen: false).isLogin) {
      User user = Provider.of<UserModel>(context, listen: false).user;
      String url = Config.baseUrl() + "user/info/get";
      var dio = new Dio();
      Map<String, dynamic> data = {"token": getToken(context)};
      FormData formData = new FormData.fromMap(data);
      var response = await dio.post(url, data: formData);
      var json = jsonDecode(response.data.toString());
      Provider.of<UserModel>(context, listen: true).user = User.fromJson(json);
      Navigator.of(context).pop();
    }
  } catch (e) {
    print(e.toString());
  }
}