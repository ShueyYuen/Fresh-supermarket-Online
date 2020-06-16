import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:xzn/page/login/login_choose.dart';
import 'package:xzn/page/product/product_show.dart';

import '../app.dart';

final List<String> loginedPage = [""];

final Map<String, WidgetBuilder> routes = {
  "app": (context) => App(),
  "login": (context) => LoginChoose(),
  "about": (context) => WebviewScaffold(
    url: "https://www.bing.com",
    appBar: AppBar(
      title: Text("关于我们"),
      leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: () {},
      ),
    ),
  )
};

var onGenerateRoute = (RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
    String routeName = settings.name;
  });
};