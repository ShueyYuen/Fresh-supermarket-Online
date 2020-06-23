import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xzn/index.dart';
import 'package:xzn/models/filter.dart';
import 'package:xzn/models/product.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/widget/product/search_card.dart';

import '../app.dart';

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  var _future;
  String token;
  // 未使用filter变量，后续优化代码时再改
  Filter filter = Filter();
  TextEditingController _key = TextEditingController();
  TextEditingController _type = TextEditingController();
  TextEditingController _max = TextEditingController();
  TextEditingController _min = TextEditingController();
  FocusNode _maxnode = FocusNode();
  FocusNode _minnode = FocusNode();

  final List<String> types = ["全部", "水果蔬菜", "水产海鲜", "肉禽蛋品", "米面粮油", "鲜奶乳品"];
  final List<Icon> orderIcons = [
    Icon(Icons.unfold_more),
    Icon(Icons.expand_less),
    Icon(Icons.expand_more)
  ];
  int priceOrderIconIndex = 0;
  int salesOrderIconIndex = 0;

  @override
  void initState() {
    token = getToken(context);
//    token = Provider.of<UserModel>(context, listen: false).user.token;
    _future = getProductRecommendList(token, quantity: 10);
    filter.tag = "全部";
    _maxnode.addListener(() {
      if (!_maxnode.hasFocus) {
        setState(() {
          if (_max.text != "")
            filter.max = int.parse(_max.text);
          else
            filter.max = null;
        });
      }
    });
    _minnode.addListener(() {
      if (!_minnode.hasFocus) {
        setState(() {
          if (_min.text != "")
            filter.min = int.parse(_min.text);
          else
            filter.min = null;
        });
      }
    });
    //_future = getSearchResultProduct(token, key: _key.toString());
    super.initState();
  }

  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  _displaySnackBar(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  void getSearch() {
    setState(() {
      _future = getSearchResultProduct(token: token,
          key: _key.text,
          type: _type.text,
          highprice: _max.text,
          lowprice: _min.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            title: Container(
                height: 32,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _key,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                )),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  getSearch();
                },
              ),
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return App(index: 2);
                      }),
                      (Route<dynamic> route) => false,
                    );
                  })
            ],
            bottom: PreferredSize(
                child: Builder(
              builder: (context) => Container(
                height: 30,
                width: double.infinity,
                color: Colors.white,
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          alignment: Alignment.center,
                            //child: Text("价格"),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                salesOrderIconIndex = 0;
                                priceOrderIconIndex = (priceOrderIconIndex + 1) % 3;
                              });
                            },
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("价格"),
                                orderIcons[priceOrderIconIndex]
                              ],
                            ),
                          )
                      )
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  priceOrderIconIndex = 0;
                                  salesOrderIconIndex = (salesOrderIconIndex + 1) % 3;
                                });
                              },
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("销量"),
                                  orderIcons[salesOrderIconIndex]
                                ],
                              ),
                            )
                      //child: Text("销量"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: FlatButton.icon(
                        icon: Icon(Icons.youtube_searched_for),
                        label: Text("筛选"),
                        onPressed: () {
                          _displaySnackBar(context);
                        },
                      ),
                    ))
                  ],
                ),
              ),
            )),
          ),
          preferredSize: Size.fromHeight(80.0),
        ),
        endDrawer: Drawer(
          semanticLabel: "Cofalconer",
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  child: Image.asset(
                "assets/image/swiper/1.webp",
                fit: BoxFit.fitWidth,
              )),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                color: Colors.grey[200],
                height: 50,
                child: Text("筛选"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("价格区间"),
                    Row(
                      children: <Widget>[
                        Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              focusNode: _minnode,
                              controller: _min,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            )),
                        Icon(Icons.more_horiz),
                        Container(
                            height: 30,
                            width: 90,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              focusNode: _maxnode,
                              controller: _max,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("分类"),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      children: types.map((_tagkey) {
                        bool _selected = filter.tag == _tagkey;
                        return RawChip(
                          checkmarkColor: Colors.white,
//                                    label: Text(sex[widget.address.person["sex"]]),
                          label: Text(_tagkey),
                          selected: _selected,
                          labelStyle: TextStyle(
                              color:
                                  _selected ? Colors.white : Colors.grey[700]),
                          onSelected: (v) {
                            setState(() {
                              filter.tag = _tagkey;
                              _type.text = _tagkey;
                            });
                          },
                          selectedColor: Theme.of(context).primaryColor,
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        filter.max = null;
                        filter.min = null;
                        filter.tag = "全部";
                        setState(() {});
                      },
                      child: Text("重置")),
                  FlatButton(
                      onPressed: () {
                        if (_max.text != "")
                          filter.max = int.parse(_max.text);
                        else
                          filter.max = null;
                        if (_min.text != "")
                          filter.min = int.parse(_min.text);
                        else
                          filter.min = null;
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          getSearch();
                        },
                        child: Text("确定"),
                      )
                      //Text("确定")
                      )
                ],
              )
            ],
          ),
        ),
        body: FutureBuilder(
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
                List<Product> data = snapshot.data.sublist(0, snapshot.data.length);
                if (priceOrderIconIndex == 1)
                  data.sort((left,right)=>(left.price["num"] - right.price["num"]).toInt());
                else if (priceOrderIconIndex == 2) data.sort((left,right)=>(right.price["num"]*right.discount - left.price["num"]*left.discount).toInt());
                widget = GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //横轴三个子widget
                      childAspectRatio: 1.0 / 1.3 //宽高比为1时，子widget
                      ),
                  children: data.map<Widget>((product) {
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
        ));
  }
}
