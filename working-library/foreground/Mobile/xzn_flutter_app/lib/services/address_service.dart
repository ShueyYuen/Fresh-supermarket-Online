import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xzn/models/index.dart';
import 'package:provider/provider.dart';

import '../conf/config.dart';
import '../states/profile_change_notifier.dart';

getAddressList(BuildContext context, String token) async {
  List<Address> address_list = List<Address>();
  try {
    print("是否登录："+Provider.of<UserModel>(context, listen: false).isLogin.toString());
    print("是否加载购物车："+Provider.of<AddressModel>(context, listen: false).is_loaded.toString());
    if (!Provider.of<AddressModel>(context, listen: false).is_loaded) {
      String url = Config.baseUrl() + "user/address/list";
      var body = {
        "token": token
      };
      var res = await http.post(url, body: body);
      var json = jsonDecode(res.body);
      for (var item in json) {
        try {
          address_list.add(Address.fromJson(item));
        } catch (e) {
          print(e.toString());
        } finally {}
      }
      Provider
        .of<AddressModel>(context, listen: false)
        .address = address_list;
      return address_list;
    } else if (Provider.of<AddressModel>(context, listen: false).is_loaded) {
      address_list = Provider.of<AddressModel>(context, listen: false).address;
    }
  } catch (e) {
    print(e.toString());
  }
  return address_list;
}