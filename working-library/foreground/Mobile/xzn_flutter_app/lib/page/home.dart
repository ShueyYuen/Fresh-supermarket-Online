import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/search_page.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/services/token.dart';
//import 'package:xzn/states/profile_change_notifier.dart';
import '../widget/home/swiper.dart';
import '../widget/home/home_product_card.dart';
import '../widget/home/home_class_list.dart';

//https://www.jianshu.com/p/cf8e92f76bdb
class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  String section = "上海市奉贤区";
  String token;
  List<Product> wordsList = List<Product>();
  ScrollController _scrollController;

  @override
  void initState() {
    token = getToken(context);
    loadProducts();
    _scrollController = ScrollController();
    super.initState();
  }

  void loadProducts() async {
    print(wordsList.length);
    List<Product> products = await getProductRecommendList(token, quantity: 10);
    wordsList.insertAll(wordsList.length, products);
    if (wordsList.length > 51) wordsList.removeRange(51, wordsList.length);
    setState(() {});
  }

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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.location_on),
                  DropdownButton(
                    underline: Text(""),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    icon: Icon(Icons.expand_more),
                    iconSize: 24,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    value: section,
                    items: secs.map((value) {
                      return DropdownMenuItem(
                          child: Text(
                            value,
                          ),
                          value: value);
                    }).toList(),
                    selectedItemBuilder: (context) {
                      return secs.map((value) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
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
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SwiperWidget(),
            ),
            SliverToBoxAdapter(
              child: HomeClassMain(),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              if(wordsList.length == 0) {
                return Text("data");
              }
              if (index >= 50) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    "没有更多了！",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                );
              }
              if (index >= wordsList.length - 1) {
                loadProducts();
                return Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: RefreshProgressIndicator(
                        strokeWidth: 3.0,
                      ),
                    ));
              }
              return HomeProduct(
                width: width,
                product: wordsList[index],
              );
            }, childCount: wordsList.length))
          ],
        ));
  }
}
