import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/index.dart';
import 'package:xzn/models/cartItem.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/states/profile_change_notifier.dart';

getCartProductList(BuildContext context) async {
//  List<CartItem> cart_list = List<CartItem>();
//  var json;
//  try {
////    if (!Provider.of<CartModel>(context, listen: false).is_cart_loaded &&
////        Provider.of<UserModel>(context, listen: false).isLogin) {
//  if (Provider.of<UserModel>(context, listen: false).isLogin) {
//      String url = Config.baseUrl() + "user/cart/query";
//      var body = {"token": token};
//      var res = await http.post(url, body: body);
//      json = jsonDecode(res.body);
//      for (var item in json) {
//        try {
//          print(item);
//          cart_list.add(CartItem.fromJson(item));
//        } catch (e) {
//          print(e.toString());
//        } finally {}
//      }
//      Provider.of<CartModel>(context, listen: false).cart = cart_list;
//      return cart_list;
//    } else if (Provider.of<UserModel>(context, listen: false).isLogin) {
//      cart_list = Provider.of<CartModel>(context, listen: false).cart;
//    }
//  } catch (e) {
//    ErrorMessage errorMessage = ErrorMessage.fromJson(json);
//    Scaffold.of(context).showSnackBar(SnackBar(content: Text(errorMessage.message)));
//    print(e.toString());
//  }
//  return cart_list;
  await Provider.of<CartModel>(context, listen: false).load();
  return Provider.of<CartModel>(context, listen: false).cart;
}

updateCart(BuildContext context, CartItem cartItem) async {
  try {
    var dio = new Dio();
    String productId = cartItem.product.product_id;
    int number = cartItem.number;
    String url = Config.baseUrl() + "api/user/cart/update";
    FormData formData = new FormData.fromMap({
      "token": getToken(context),
      "product_id": productId,
      "number": number
    });
    var response = await dio.post(url, data: formData);
    var json = jsonDecode(response.data.toString());
    if (json["success"]) {
      if (number == 0)
        Provider.of<CartModel>(context, listen: false).delete(productId);
      else if (Provider.of<CartModel>(context, listen: false)
          .isExist(cartItem.product))
        Provider.of<CartModel>(context, listen: false)
            .update(productId, number);
      else Provider.of<CartModel>(context, listen: false).add(cartItem.product, number);
      return true;
    }
  } catch (e) {}
  return false;
//  return product;
}
