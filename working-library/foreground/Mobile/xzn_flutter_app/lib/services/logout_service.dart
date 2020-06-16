import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/states/profile_change_notifier.dart';

void Logout(BuildContext context) {
    Provider.of<UserModel>(context, listen: false).user = null;
    Provider.of<CartModel>(context, listen: false).cart = null;
    Provider.of<OrderModel>(context, listen: false).order =
    null;
    Provider.of<AddressModel>(context, listen: false).address =
    null;
}