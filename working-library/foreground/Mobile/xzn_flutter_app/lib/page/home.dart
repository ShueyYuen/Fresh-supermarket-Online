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
  String section = "上海市奉贤区";
  @override
  Widget build(BuildContext context) {
    final List<String> secs = [
      '上海市奉贤区',
      '上海市黄浦区',
      '上海市徐汇区',
      '上海市长宁区',
      '上海市浦东新区',
      '上海市嘉定区',
      '上海市崇明区'
    ];
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on),
                DropdownButton(
                  underline: Text(""),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                  icon: Icon(Icons.expand_more),
                  iconSize: 24,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  value: section,
                  items: secs.map((value) {
                    return DropdownMenuItem(child: Text(value,), value: value);
                  }).toList(),
                  selectedItemBuilder: (context) {
                    return secs.map((value) {
                      return Container(alignment: Alignment.center,child: Text(value, style: TextStyle(color: Colors.white),),);
                    }).toList();
                  },
                  onChanged: (value) {
                    setState(() {
                      section = value;
                    });
                  },
                ),
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
                        children: <Widget>[Icon(Icons.search), Text("麻辣香锅")],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProductSearchPage();
                        }));
                      },
                    )))),
        preferredSize: Size.fromHeight(100.0),
      ),
      body: ListView(
        children: <Widget>[SwiperWidget(), HomeClassList(), HomeProductList()],
      ),
    );
  }
}
