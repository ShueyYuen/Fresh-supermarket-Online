import 'package:flutter/material.dart';

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
//  {
//    List<CartItem> result = List<CartItem>();
//    for (var cartItem in _profile.cart) {
//      print("1245");
////      result.add(cartItem);
//      print(result);
//    }
//    return _profile.cart;
//  }
  // 是否加载过my_order
  bool get is_cart_loaded => _profile.user != null && cart != null && cart.isNotEmpty;

  int get cart_count => is_cart_loaded?cart.length:0;

  set cart(List<CartItem> cart) {
    _profile.cart = cart;
    notifyListeners();
  }
}