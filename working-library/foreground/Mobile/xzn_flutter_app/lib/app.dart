import 'package:flutter/material.dart';
import 'page/cart.dart';
import 'page/classification.dart';
import 'page/home.dart';
import 'page/my.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AppState();
}

class _AppState extends State<App> {
  var _currentIndex = 0;

  Home home;
  Classification classification;
  Cart cart;
  My my;

  currentPage() {
    switch(_currentIndex) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("鲜着呢"),
        leading: Icon(Icons.home),
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.search),
            ),
            onTap: () {
              Navigator.pushNamed(context, "login");
            },
          ),
        ],
      ),
      body: currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("首页"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text("分类"),
            icon: Icon(Icons.search)
          ),
          BottomNavigationBarItem(
            title: Text("购物车"),
            icon: Icon(Icons.shopping_cart)
          ),
          BottomNavigationBarItem(
            title: Text("我的"),
            icon: Icon(Icons.person)
          ),
        ]
      ),
    );
  }
}