import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/search_page.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/widget/product/search_card.dart';

class Classification extends StatefulWidget {
  Classification({
    Key key,
    this.idx: 0,
  }) : super(key: key);
  int idx;

  @override
  _ClassificationState createState() => new _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  String section = "上海市奉贤区";

  final List<String> _tabValues = [
    '水果蔬菜',
    '肉禽蛋品',
    '水产海鲜',
    '米面粮油',
    '鲜奶乳品',
  ];

  final List<String> secs = [
    '上海市奉贤区',
    '上海市黄浦区',
    '上海市徐汇区',
    '上海市长宁区',
    '上海市浦东新区',
    '上海市嘉定区',
    '上海市崇明区'
  ];

  final List<List<Product>> _tabs = [null, null, null, null, null];

  TabController _controller;
  String type_value;
  var _future;
  String _token;

  @override
  void initState() {
    super.initState();

    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
    _controller.index = widget.idx ?? 0;
    _controller.addListener(() {
      setState(() {
        if (_token != "")
          _future = getSearchResultProduct(
              token: _token, type: _tabValues[_controller.index]);
        else
          _future = getSearchResultProduct(type: _tabValues[_controller.index]);
      });
    });
    _token = getToken(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          centerTitle: true,
          //title: Text('分类'),
          title: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Row(
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
                      )
                    ]),
              ),
              Expanded(
                flex: 6,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: 190,
                    child: FlatButton(
                      color: Colors.white,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.light,
                      splashColor: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.search),
                          Text("麻辣香锅", style: TextStyle(fontSize: 16))
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ProductSearchPage();
                        }));
                      },
                    )),
              )
            ],
          ),
          bottom: TabBar(
            tabs: _tabValues.map((f) {
              return Container(
                //height: 20,
                width: 80,
                child: Column(
                  children: <Widget>[
                    //GestureDetector(
                    Container(
                      //onTap: _changeType,
                      //onTap: "",
                      child: Stack(
                        children: <Widget>[
                          Container(
                              height: 25,
                              child: _tabValues[_controller.index] == f
                                  ? Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.orangeAccent,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Text(f),
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      child: Text(f)))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            controller: _controller,
            indicatorColor: Colors.orangeAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.only(bottom: 100),
            indicator: null,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorWeight: 5.0,
            labelStyle: TextStyle(
              height: 1,
            ),
          ),
        ),
        preferredSize: Size.fromHeight(90.0),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues.map((f) {
          // 商品推荐卡片
          if (_tabs[_tabValues.indexOf(f)] != null)
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //横轴三个子widget
                childAspectRatio: 1.0 / 1.3 //宽高比为1时，子widget
              ),
              children: _tabs[_tabValues.indexOf(f)].map<Widget>((product) {
                return SearchCard(
                  product: product,
                );
              }).toList(),
            );
          return FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              var widget;
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  widget = Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 48,
                  );
                } else {
                  _tabs[_tabValues.indexOf(f)] = snapshot.data;
                  widget = GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, //横轴三个子widget
                        childAspectRatio: 1.0 / 1.3 //宽高比为1时，子widget
                        ),
                    children: snapshot.data.map<Widget>((product) {
                      return SearchCard(
                        product: product,
                      );
                    }).toList(),
                  );
                }
              } else {
                widget = Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(),
                    ));
              }
              return widget;
            },
          );
        }).toList(),
      ),
    );
  }
}
