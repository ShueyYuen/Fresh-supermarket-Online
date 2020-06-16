import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:xzn/models/cartItem.dart';
import 'package:xzn/models/product.dart';

import '../conf/config.dart';
import '../states/profile_change_notifier.dart';

getProductDetails(String token, String product_id) async {
  String url = Config.baseUrl() + "user/product/detail";
  Product product = Product();
  var body = {"token": token, "product_id": product_id};
  var res = await http.post(url, body: body);
  var json = jsonDecode(res.body);
  try {
    product = Product.fromJson(json);
  } catch (e) {
    print(e.toString());
  } finally {}
  return product;
}

getProductRecommendList(String token, {int quantity: 10}) async {
  String url = Config.baseUrl() + "user/product/recommend";
  List<Product> product_list = List<Product>();
  var body = {"token": token, "quantity": quantity.toString()};
  var res = await http.post(url, body: body);
  var json = jsonDecode(res.body);
  for (var item in json) {
    try {
      product_list.add(Product.fromJson(item));
    } catch (e) {
      print(e.toString());
    } finally {}
  }
  return product_list;
}

getCartProductList(BuildContext context, String token) async {
  List<CartItem> cart_list = List<CartItem>();
  try {
    if (!Provider.of<CartModel>(context, listen: false).is_cart_loaded &&
        Provider.of<UserModel>(context, listen: false).isLogin) {
      String url = Config.baseUrl() + "user/cart/query";
      var body = {"token": token};
      var res = await http.post(url, body: body);
      var json = jsonDecode(res.body);
      for (var item in json) {
        try {
          cart_list.add(CartItem.fromJson(item));
        } catch (e) {
          print(e.toString());
        } finally {}
      }
      Provider.of<CartModel>(context, listen: false).cart = cart_list;
      return cart_list;
    } else if (Provider.of<UserModel>(context, listen: false).isLogin) {
      cart_list = Provider.of<CartModel>(context, listen: false).cart;
    }
  } catch (e) {
    print(e.toString());
  }
  return cart_list;
}
