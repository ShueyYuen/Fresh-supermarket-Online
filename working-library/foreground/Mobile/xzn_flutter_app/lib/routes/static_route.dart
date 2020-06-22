import 'package:flutter/material.dart';
import 'package:xzn/page/login/login_choose.dart';

import '../app.dart';

final List<String> loginedPage = [""];

final Map<String, WidgetBuilder> routes = {
  "app": (context) => App(),
  "login": (context) => LoginChoose(),
};

var onGenerateRoute = (RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
    String routeName = settings.name;
  });
};