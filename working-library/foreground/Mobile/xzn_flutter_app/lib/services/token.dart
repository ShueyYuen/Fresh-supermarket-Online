import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/states/profile_change_notifier.dart';

String getToken(BuildContext context) {
  String token = "";
  try {
    String token = Provider
      .of<UserModel>(context)
      .user
      .token;
  } catch (e) {
  }
  return token;
}