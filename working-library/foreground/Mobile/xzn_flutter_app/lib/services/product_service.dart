import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
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
  var body = {"token": token, "gnum": quantity.toString()};
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

getSearchResultProduct(String token,
    {String key: "",
    String type: "",
    String highprice: "",
    String lowprice: ""}) async {
  String url = Config.baseUrl() + "api/product/search";
  List<Product> product_list = List<Product>();
  var body = {
    "token": token,
    "key": key,
    "type": type,
    "highprice": highprice,
    "lowprice": lowprice
  };
  var dio = new Dio();
  FormData formData = new FormData.fromMap(body);
  var res = await dio.post(url, data: formData);
  //var res = await http.post(url, body: body);
  var json = jsonDecode(res.data.toString());
  //print(json);
  for (var item in json) {
    try {
      product_list.add(Product.fromJson(item));
    } catch (e) {
      print(e.toString());
    } finally {}
  }
  return product_list;
}
