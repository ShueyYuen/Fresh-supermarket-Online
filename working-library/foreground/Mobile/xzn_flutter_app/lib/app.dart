import 'package:flutter/material.dart';
import 'page/cart.dart';
import 'page/classification.dart';
import 'page/home.dart';
import 'page/my.dart';

class App extends StatefulWidget {
  App({Key key, this.index: 0}) : super(key: key);

  int index;

  @override
  State<StatefulWidget> createState() => new _AppState();
}

class _AppState extends State<App> {
  var _currentIndex = 0;

  Home home;
  Classification classification;
  Cart cart;
  My my;

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('多玩一会儿嘛！'),
            content: new Text('我让雷姆出卖**，您就不能多留一会嘛！'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('躺好'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('节操离去'),
              ),
            ],
          ),
        ) ??
        false;
  }

  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (home == null) {
          home = Home();
        }
        return home;
      case 1:
        if (classification == null) {
          classification = Classification();
        }
        return classification;
      case 2:
        if (cart == null) {
          cart = Cart();
        }
        return cart;
      case 3:
        if (my == null) {
          my = My();
        }
        return my;
    }
  }

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: currentPage(),
          bottomNavigationBar: BottomNavigationBar(
//        type: BottomNavigationBarType.fixed,
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.black,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    title: Text("首页"), icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    title: Text("分类"), icon: Icon(Icons.list)),
                BottomNavigationBarItem(
                    title: Text("购物车"), icon: Icon(Icons.shopping_cart)),
                BottomNavigationBarItem(
                    title: Text("我的"), icon: Icon(Icons.person)),
              ]),
        ));
  }
}
