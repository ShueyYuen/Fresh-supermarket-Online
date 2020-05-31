import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xzn/models/index.dart';
import 'package:provider/provider.dart';

import '../conf/config.dart';
import '../states/profile_change_notifier.dart';

getOrderList(BuildContext context, String token) async {
  List<Order> order_list = List<Order>();
  try {
    if (!Provider.of<OrderModel>(context, listen: false).is_loaded) {
      String url = Config.baseUrl() + "user/order/list";
      var body = {
        "token": token
      };
      var res = await http.post(url, body: body);
      var json = jsonDecode(res.body);
      for (var item in json) {
        try {
          order_list.add(Order.fromJson(item));
        } catch (e) {
          print(e.toString());
        } finally {}
      }
      Provider
        .of<OrderModel>(context, listen: false)
        .order = order_list;
      return order_list;
    } else if (Provider.of<OrderModel>(context, listen: false).is_loaded) {
      order_list = Provider.of<OrderModel>(context, listen: false).order;
    }
  } catch (e) {
    print(e.toString());
  }
  return order_list;
}

