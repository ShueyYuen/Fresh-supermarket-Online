import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:xzn/index.dart';
import 'package:xzn/states/profile_change_notifier.dart';

import 'page/login/login_choose.dart';
import 'app.dart';
import 'common/global.dart';
import 'loading.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: MyOrderModel()),
        ChangeNotifierProvider.value(value: CartModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "鲜着呢",
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
                onPressed: () {},
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
