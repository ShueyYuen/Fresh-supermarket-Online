import 'package:flutter/material.dart';
import 'package:xzn/models/address.dart';
import 'package:xzn/models/order.dart';

import 'package:provider/provider.dart';

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

  void delete(String product_id) {
    for (CartItem cartItem in this.cart) {
      if (cartItem.product.product_id == product_id) {
        this.cart.remove(cartItem);
        break;
      }
    }
    notifyListeners();
  }

  Product getProductById(String product_id) {
    for (CartItem cartItem in this.cart) {
      if (cartItem.product.product_id == product_id) {
        return cartItem.product;
      }
    }
  }

  void shut(List<CartItem> s_cart) {}

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

  set address(List<Address> address) {
    _profile.address = address;
    notifyListeners();
  }

  void delete(address_id) {
    for (Address address in this.address) {
      if (address.address_id == address_id) {
        this.address.remove(address);
        break;
      }
    }
    notifyListeners();
  }

  void update(Address address) {
    bool add = true;
    for (Address item in this.address) {
      if (item.address_id == address.address_id) {
        item = address;
        print(item.toString());
        break;
      }
    }
    if (add) this.address.add(address);
    notifyListeners();
  }
}

class OrderModel extends ProfileChangeNotifier {
  List<Order> get order => _profile.order;
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
    if (order == null) return count;
    for (Order order_item in order) {
      if (order_item.order_status.contains(type)) count++;
    }
    return count;
  }
}
