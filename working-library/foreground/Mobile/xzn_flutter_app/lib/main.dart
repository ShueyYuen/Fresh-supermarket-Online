import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'package:xzn/states/profile_change_notifier.dart';
import 'package:xzn/style/base_theme.dart';
import 'page/login/login_choose.dart';
import 'app.dart';
import 'common/global.dart';
import 'loading.dart';

void main() => Global.init().then((e) async {
//      AMapLocationClient.setApiKey("cb904fc25db7d0b715dabb813be2b6a0");
      runApp(MultiProvider(providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: UserModel()),
      ], child: MyApp()));
      await enableFluttifyLog(false);
      await AmapService.init(
        iosKey: '7a04506d15fdb7585707f7091d715ef4',
        androidKey: 'cb904fc25db7d0b715dabb813be2b6a0',
      );
    });

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool first;

  @override
  void initState() {
    first = Provider.of<UserModel>(context, listen: false).first;
    print(first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    Locale myLocale = Localizations.localeOf(context);
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: CartModel()),
        ChangeNotifierProvider.value(value: OrderModel()),
        ChangeNotifierProvider.value(value: AddressModel()),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
//          DemoLocalizationsDelegate(),
        ],
//        debugShowMaterialGrid: true,
//        showPerformanceOverlay: true,
        supportedLocales: [
          const Locale('zh', 'CH'),
          const Locale('en', 'US'),
        ],
        locale: Locale('zh', 'CH'),
        debugShowCheckedModeBanner: false,
        title: "鲜着呢",
        theme: base,
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
          child: first ? LoadingPage() : App(),
        ),
      ),
    );
  }
}
