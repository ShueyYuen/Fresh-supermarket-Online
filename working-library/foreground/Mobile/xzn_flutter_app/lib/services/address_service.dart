import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:xzn/index.dart';
import 'package:xzn/models/address.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/utils/stringfy.dart';

import '../conf/config.dart';
import '../states/profile_change_notifier.dart';

//返回地址详情
getAddressDetail(TextEditingController address) async {
  String aMapWebKey = "530a8069770558e6e9e0db21c2cd8bc3";
  String url = "https://restapi.amap.com/v3/geocode/geo?address=" + address.text + "&key=" + aMapWebKey;
  dynamic res = await http.get(url);
  var json = jsonDecode(res.body);
  //print(json);
  Amapgeo addressMap = new Amapgeo();
  addressMap.province = json["geocodes"][0]["province"];
  addressMap.city = json["geocodes"][0]["city"];
  addressMap.district = json["geocodes"][0]["district"];
  if (json["geocodes"][0]["township"].length == 0) {
    addressMap.township = "";
  } else {
    addressMap.township = json["geocodes"][0]["township"][0];
  }
  if (json["geocodes"][0]["street"].length == 0) {
    addressMap.street = "";
  } else {
    addressMap.street = json["geocodes"][0]["street"][0];
  }
  if (json["geocodes"][0]["number"].length == 0) {
    addressMap.no = "";
  } else {
    addressMap.no = json["geocodes"][0]["number"][0];
  }

  var location = json["geocodes"][0]["location"].toString().split(",");
  addressMap.longitude = double.parse(location[0]);
  addressMap.latitude = double.parse(location[1]);
  print(addressMap.toJson());

  return addressMap;
}

getAddressList(BuildContext context, String token) async {
  List<Address> address_list = List<Address>();
  try {
//    if (!Provider.of<AddressModel>(context, listen: false).is_loaded && Provider.of<UserModel>(context, listen: false).isLogin) {
    if (Provider.of<UserModel>(context, listen: false).isLogin) {
      String url = Config.baseUrl() + "user/address/list";
      var body = {
        "token": token
      };
      var res = await http.post(url, body: body);
      var json = jsonDecode(res.body);
      for (var item in json) {
        try {
          print(url);
          print(item);
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

//updateAddress(BuildContext context, Address address) async {
//  try {
//    if (Provider.of<UserModel>(context, listen: false).isLogin) {
//      String url = Config.baseUrl() + "user/address/update";
//      var body = address.toJson();
//      body["token"] = getToken(context);
//      var res = await http.post(url, body: body);
//      var json = jsonDecode(res.body);
//      address.address_id = json["address_id"];
//      Provider
//        .of<AddressModel>(context, listen: false)
//        .update(address);
//      return address.address_id;
//    } else if (Provider.of<AddressModel>(context, listen: false).is_loaded) {
//    }
//  } catch (e) {
//    print(e.toString());
//  }
//}

updateAddress(BuildContext context, Address address) async {
  try {
    if (Provider.of<UserModel>(context, listen: false).isLogin) {
      String url = Config.baseUrl() + "user/address/update";
      var body = address.toJson();
      var dio = new Dio();
      body["token"] = getToken(context);
      body["person"] = stringfy(body["person"]);
      body["detail"] = stringfy(body["detail"].toJson());
      FormData formData = new FormData.fromMap(body);
      var res = await dio.post(url, data: formData);
      var json = jsonDecode(res.data.toString());
      address.address_id = int.parse(json["address_id"]);
      print(address.address_id);
      Provider
        .of<AddressModel>(context, listen: false)
        .update(address);
      return address.address_id;
    } else if (Provider.of<AddressModel>(context, listen: false).is_loaded) {
    }
  } catch (e) {
    print(e.toString());
  }
}

deleteAddress(BuildContext context, Address address) async {
  try {
    if (Provider.of<UserModel>(context, listen: false).isLogin) {
      String url = Config.baseUrl() + "user/address/delete";
      var dio = new Dio();
      var body = {
        "address_id": address.address_id
      };
      FormData formData = new FormData.fromMap(body);
      var res = await dio.post(url, data: formData);
      var json = jsonDecode(res.data.toString());
      print(json);
      if(json["success"]) {
        Provider.of<AddressModel>(context)
          .delete(address.address_id);
        return json["success"];
      }
      return false;
    } else if (Provider.of<AddressModel>(context, listen: false).is_loaded) {
    }
  } catch (e) {
    print(e.toString());
  }
}