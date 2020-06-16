import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:xzn/models/address.dart';

import '../conf/config.dart';
import '../states/profile_change_notifier.dart';

getAddressList(BuildContext context, String token) async {
  List<Address> address_list = List<Address>();
  try {
    if (!Provider.of<AddressModel>(context, listen: false).is_loaded && Provider.of<UserModel>(context).isLogin) {
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
