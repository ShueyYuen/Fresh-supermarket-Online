import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'loading.dart';
import 'app.dart';
import 'page/login_choose.dart';
import 'states/app_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store(reducer, initialState: 0);
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "鲜着呢",//闲着呢、贤者呢
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          "app": (context) => App(),
          "login": (context) => LoginChoose(),
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
      ),
    );
  }
}