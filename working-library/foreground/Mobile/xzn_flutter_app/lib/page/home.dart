import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/search_page.dart';
import '../widget/home/swiper.dart';
import '../widget/home/home_product_list.dart';
import '../widget/home/home_class_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.location_on),
              Text("上海市奉贤区"),
              Icon(Icons.expand_more),
            ],
          ),
          centerTitle: true,
          bottom: PreferredSize(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: FlatButton(
                color: Colors.white,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.light,
                splashColor: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.search),
                    Text("麻辣香锅")
                  ],
                ),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductSearchPage();
                      }
                    )
                  );
                },
              )
            )
          )
        ),
        preferredSize: Size.fromHeight(100.0),
      ),
      body: ListView(
        children: <Widget>[SwiperWidget(), HomeClassList(), HomeProductList()],
      ),
    );
  }
}
