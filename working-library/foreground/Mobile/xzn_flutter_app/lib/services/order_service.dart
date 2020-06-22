import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:xzn/index.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/utils/stringfy.dart';

import '../conf/config.dart';
import '../states/profile_change_notifier.dart';

getOrderList(BuildContext context, String token) async {
  await Provider.of<OrderModel>(context, listen: false).load();
  return Provider.of<OrderModel>(context, listen: false).order;
}

cancelOrder(BuildContext context, int order_id) async {
  try {
    if (Provider.of<UserModel>(context, listen: false).isLogin) {
      String url = Config.baseUrl() + "user/order/cancel";
      var dio = new Dio();
      FormData formData = new FormData.fromMap(
          {"token": getToken(context), "order_id": order_id});
      var response = await dio.post(url, data: formData);
      var json = jsonDecode(response.data.toString());
      if (json["success"]) {
        Provider.of<OrderModel>(context).setOrderState(order_id, 0);
        return true;
      }
    }
  } catch (e) {
    print(e.toString());
  }
  return false;
}

submitOrder(BuildContext context, String token, List<CartItem> orders,
    Address address, bool secret, String remark, double price) async {
  List<String> products = List<String>();
  try {
    if (Provider.of<UserModel>(context, listen: false).isLogin) {
      String url = Config.baseUrl() + "user/order/paystate";
      for (CartItem cartItem in orders) {
        products.add(cartItem.product.product_id);
      }
      var dio = new Dio();
      FormData formData = new FormData.fromMap({
        "token": token,
        "orders": stringfy_list(products),
        "address_id": address.address_id,
        "secret": secret,
        "remark": remark
      });
      var response = await dio.post(url, data: formData);
      var json = jsonDecode(response.data.toString());
      if (json["order_id"] != null) {
        for (String product_id in products) {
          Provider.of<CartModel>(context, listen: true).delete(product_id);
        }
        Provider.of<OrderModel>(context, listen: true).load(force: true);
      }
      return json["order_id"].toString();
    }
  } catch (e) {
    print(e.toString());
  }
}

xznpay(BuildContext context, int order_id) async {
  var json;
  try {
    // TODO: 更新后前端一起更新数据
//    if (!Provider.of<OrderModel>(context, listen: false).is_loaded &&
//        Provider.of<UserModel>(context, listen: false).isLogin) {
    if (Provider.of<UserModel>(context, listen: false).isLogin) {
      String url = Config.baseUrl() + "user/order/xznpay";
      var dio = new Dio();
      FormData formData = new FormData.fromMap(
          {"token": getToken(context), "order_id": order_id});
      var response = await dio.post(url, data: formData);
      json = jsonDecode(response.data.toString());
      if (json["success"]) {
        Provider.of<OrderModel>(context, listen: false).setOrderState(order_id, 2);
        print("支付完成");
        return true;
      }
      else
        return false;
    }
  } catch (e) {
    ErrorMessage errorMessage = ErrorMessage.fromJson(json);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [Icon(Icons.local_offer), Text(errorMessage.message)],
      ),
      behavior: SnackBarBehavior.floating,
    ));
    print(e.toString());
  }
  return false;
}

confirmGoods(BuildContext context, int order_id) async {
  try {
    if (Provider.of<UserModel>(context, listen: false).isLogin) {
      String url = Config.baseUrl() + "user/order/confirm";
      var dio = new Dio();
      FormData formData = new FormData.fromMap(
          {"token": getToken(context), "order_id": order_id});
      var response = await dio.post(url, data: formData);
      var json = jsonDecode(response.data.toString());
      if (json["success"]) {
        Provider.of<OrderModel>(context, listen: false).setOrderState(order_id, 4);
      }
    }
  } catch (e) {
    print(e.toString());
  }
}
