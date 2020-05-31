import 'package:flutter/material.dart';
import 'package:xzn/models/address.dart';
import 'package:xzn/models/order.dart';

import '../common/global.dart';

// 导入需要全局使用的模型
import '../models/profile.dart';
import '../models/user.dart';
import '../models/myOrder.dart';
import '../models/cartItem.dart';

class ProfileChangeNotifier extends ChangeNotifier{
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}

class UserModel extends ProfileChangeNotifier{
  User get user => _profile.user;
  // 是否登录
  bool get isLogin => user != null;

  set user(User user) {
    _profile.user = user;
    notifyListeners();
  }
}

class MyOrderModel extends ProfileChangeNotifier{
  MyOrder get my_order => _profile.my_order;
  // 是否加载过my_order
  bool get isLoaded => my_order != null;

  set my_order(MyOrder my_order) {
    _profile.my_order = my_order;
    notifyListeners();
  }
}

class CartModel extends ProfileChangeNotifier{
  List<CartItem> get cart => _profile.cart;
  // 是否加载过my_order
  bool get is_cart_loaded => _profile.user != null && cart != null;

  int get cart_count => is_cart_loaded?cart.length:0;

  set cart(List<CartItem> cart) {
    _profile.cart = cart;
    notifyListeners();
  }
}

class AddressModel extends ProfileChangeNotifier{
  List<Address> get address => _profile.address;
  // 是否加载过my_order
  bool get is_loaded => _profile.user != null && address != null;

  set address(List<Address> address) {
    _profile.address = address;
    notifyListeners();
  }
}

class OrderModel extends ProfileChangeNotifier{
  List<Order> get order => _profile.order;
  // 是否加载过my_order
  bool get is_loaded => _profile.user != null && order != null;
  int get unpaid => countStatus("unpaid");
  int get unreceived => countStatus("unreceived");
  int get uncomment => countStatus("uncomment");
  int get finished => countStatus("finished");

  set order(List<Order> order) {
    _profile.order = order;
    notifyListeners();
  }

  int countStatus(String type) {
    int count = 0;
    for (Order order_item in order) {
      if (order_item.order_status == type) count++;
    }
    return count;
  }
}