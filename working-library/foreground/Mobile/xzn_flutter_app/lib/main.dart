import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'loading.dart';
import 'app.dart';
import 'page/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "鲜着呢",//闲着呢、贤者呢
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "app": (context) => App(),
        "login": (context) => Login(),
        "about": (context) => WebviewScaffold(
          url: "https://www.bing.com",
          appBar: AppBar(
            title: Text("关于我们"),
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: (){},
            ),
          ),
        )
      },
      home: Center(
        child: LoadingPage(),
      ),
    );
  }
}