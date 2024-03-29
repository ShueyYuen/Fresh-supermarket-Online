import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/states/profile_change_notifier.dart';

String getToken(BuildContext context) {
  String token = "";
  try {
    token = Provider
      .of<UserModel>(context, listen: false)
      .user
      .token;
  } catch (e) {
  }
  return token;
}