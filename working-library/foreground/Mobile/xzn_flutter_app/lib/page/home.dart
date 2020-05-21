import 'package:flutter/material.dart';
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
        child: AppBar(),
        preferredSize: Size.fromHeight(0.0),
      ),
      body: ListView(
        children: <Widget>[SwiperWidget(), HomeClassList(), HomeProductList()],
      ),
    );
  }
}
