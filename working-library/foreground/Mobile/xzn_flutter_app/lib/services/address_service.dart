import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xzn/models/index.dart';
import 'package:provider/provider.dart';

import '../conf/config.dart';
import '../states/profile_change_notifier.dart';

//返回地址详情
getAddressDetail(TextEditingController address) async {
  print(address);
  String aMapWebKey = "530a8069770558e6e9e0db21c2cd8bc3";
  String url = "https://restapi.amap.com/v3/geocode/geo?address=" + address.text + "&key=" + aMapWebKey;
  dynamic res = await http.get(url);
  var json = jsonDecode(res.body);
  //print(json);
  Map addressMap = new Map();
  addressMap["province"] = json["geocodes"][0]["province"];
  addressMap["city"] = json["geocodes"][0]["city"];
  addressMap["district"] = json["geocodes"][0]["district"];
  addressMap["township"] = json["geocodes"][0]["township"];
  addressMap["street"] = json["geocodes"][0]["street"];
  addressMap["no"] = json["geocodes"][0]["number"];
  //print(addressMap);
  return addressMap;
}

getAddressList(BuildContext context, String token) async {
  List<Address> address_list = List<Address>();
  try {
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
