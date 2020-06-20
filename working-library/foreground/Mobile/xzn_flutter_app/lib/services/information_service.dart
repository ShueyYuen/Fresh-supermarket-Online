import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/models/user.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/states/profile_change_notifier.dart';

updateInformation(BuildContext context, {
  nickname: "", sex: "", password: ""
}) async {
  try {
    // TODO: 更新后前端一起更新数据
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
      if(password != "") data["password"] = password;
      if (data.keys.length != 1) {
        FormData formData = new FormData.fromMap(data);
        var response = await dio.post(url, data: formData);
        var json = jsonDecode(response.data.toString());
        print(json);
      }
    }
  } catch (e) {
    print("Cofalconer");
    print(e.toString());
  }
}