import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/models/address.dart';
import 'package:xzn/models/ads.dart';
import 'package:xzn/models/order.dart';
import 'package:xzn/services/address_service.dart';
import '../common/global.dart';
// 导入需要全局使用的模型
import '../models/product.dart';
import '../models/profile.dart';
import '../models/user.dart';
import '../models/cartItem.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}

class UserModel extends ProfileChangeNotifier {
  bool get first => _profile.first_load ?? true;
  User get user => _profile.user;
  // 是否登录
  bool get isLogin => user != null;

  set first(bool first) {
    _profile.first_load = first;
    notifyListeners();
  }

  set user(User user) {
    _profile.user = user;
    notifyListeners();
  }
}

class CartModel extends ProfileChangeNotifier {
  List<CartItem> get cart => _profile.cart;
  // 是否加载过my_order
  bool get is_cart_loaded => _profile.user != null && cart != null;

  int get cart_count => is_cart_loaded ? cart.length : 0;

  set cart(List<CartItem> cart) {
    _profile.cart = cart;
    notifyListeners();
  }

  void load() async {
    print("加载了呢$is_cart_loaded,load");
    if (is_cart_loaded) return;
    try {
      List<CartItem> cart_list = List<CartItem>();
      String url = Config.baseUrl() + "user/cart/query";
      var dio = new Dio();
      var body = {"token": _profile.user.token};
      FormData formData = new FormData.fromMap(body);
      print("请求开始,load");
      var res = await dio.post(url, data: formData);
      print("请求结束,load");
      var json = jsonDecode(res.data.toString());
      for (var item in json) {
        try {
          print(item);
          cart_list.add(CartItem.fromJson(item));
        } catch (e) {
          print(e.toString());
        } finally {}
      }
      print("加载完购物车");
      cart = cart_list;
    } catch (e) {}
  }

  void delete(String product_id) {
    this.cart.removeWhere((element) {
      return element.product.product_id == product_id;
    });
    notifyListeners();
  }

  Product getProductById(String product_id) {
    for (CartItem cartItem in this.cart) {
      if (cartItem.product.product_id == product_id) {
        return cartItem.product;
      }
    }
  }

  void update(String product_id, int num) {
    for (int i = 0; i <= cart_count; i++) {
      if (cart[i].product.product_id == product_id) {
        cart[i].number = num;
        break;
      }
    }
    notifyListeners();
  }

  void add(Product product, int num) {
    if (!isExist(product))
      _profile.cart
          .add(CartItem.fromJson({"product": product.toJson(), "number": num}));
    notifyListeners();
  }

  bool isExist(Product product) {
    if (cart == null) return true;
    for (CartItem cartItem in cart) {
      if (cartItem.product.product_id == product.product_id) {
        return true;
      }
    }
    return false;
  }
}

class AddressModel extends ProfileChangeNotifier {
  List<Address> get address => _profile.address;
  // 是否加载过my_order
  bool get is_loaded => _profile.user != null && address != null;

  void load() async {
    if (is_loaded) return;
    try {
      List<Address> address_list = List<Address>();
      String url = Config.baseUrl() + "user/address/list";
      var dio = new Dio();
      var body = {"token": _profile.user.token};
      FormData formData = new FormData.fromMap(body);
      var res = await dio.post(url, data: formData);
      var json = jsonDecode(res.data.toString());
      for (var item in json) {
        try {
          address_list.add(Address.fromJson(item));
        } catch (e) {
          print(e.toString());
        } finally {}
      }
      address = address_list;
    } catch (e) {
      print(e.toString());
    }
  }

  set address(List<Address> address) {
    _profile.address = address;
    notifyListeners();
  }

  void delete(address_id) {
    if (!is_loaded) ;
    this.address.removeWhere((element) {
      return element.address_id == address_id;
    });
    notifyListeners();
  }

  void update(Address address) {
    this.address.removeWhere((element) {
      return element.address_id == address.address_id;
    });
    this.address.add(address);
    notifyListeners();
  }
}

class OrderModel extends ProfileChangeNotifier {
  List<Order> get order => _profile.order;
  bool get is_loaded => _profile.user != null && order != null;
  int get unpaid => countStatus(1);
  int get unreceived => countStatus(2);
  int get unconfirm => countStatus(3);
  int get finished => countStatus(4);

  set order(List<Order> order) {
    _profile.order = order;
    notifyListeners();
  }

  void load({bool force: false}) async {
    if (is_loaded && !force) return;
    print("强制加载Order");
    List<Order> order_list = List<Order>();
    try {
      String url = Config.baseUrl() + "user/order/list";
      var dio = new Dio();
      FormData formData = new FormData.fromMap({"token": _profile.user.token});
      var response = await dio.post(url, data: formData);
      var json = jsonDecode(response.data.toString());
      for (var item in json) {
        try {
          order_list.add(Order.fromJson(item));
        } catch (e) {
          print(e.toString());
        } finally {}
      }
      order = order_list;
    } catch (e) {
      print(e.toString());
    }
  }

  void setOrderState(int order_id, int state) {
    if (!is_loaded) load();
    for (Order item in order) {
      if (item.order_id == order_id) {
        item.order_status = state;
        break;
      }
    }
    notifyListeners();
  }

  void add(Order order_item) {
    order.add(order_item);
    notifyListeners();
  }

  int countStatus(int type) {
    int count = 0;
    if (order == null) return count;
    for (Order order_item in order) {
      if (order_item.order_status == type) count++;
    }
    return count;
  }
}
