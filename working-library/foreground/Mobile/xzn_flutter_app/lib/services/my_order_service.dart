import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xzn/models/index.dart';
import 'package:provider/provider.dart';

import '../conf/config.dart';
import '../states/profile_change_notifier.dart';

getMyOrder(BuildContext context) async {
  if (!Provider.of<MyOrderModel>(context, listen: false).isLoaded &&
    Provider.of<UserModel>(context, listen: false).isLogin) {
    String url = Config.baseUrl() + "user/my";
    var my_order = MyOrder();
    var body = {
      "token": Provider
        .of<UserModel>(context, listen: false)
        .user
        .token
    };
    var res = await http.post(url, body: body);
    var json = jsonDecode(res.body);
    try {
      my_order = MyOrder.fromJson(json);
      // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
      Provider
        .of<MyOrderModel>(context, listen: true)
        .my_order = my_order;
    } catch (e) {
      print(e.toString());
    } finally {}
    return my_order;
  }
}