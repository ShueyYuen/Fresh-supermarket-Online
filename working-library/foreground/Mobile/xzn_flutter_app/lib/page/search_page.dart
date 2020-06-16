import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/models/product.dart';
import 'package:xzn/page/product/product_show.dart';
import 'package:xzn/services/picture.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/states/profile_change_notifier.dart';

import '../app.dart';

class SearchCard extends StatelessWidget {
  SearchCard({Key key, this.product}) : super(key: key);

  Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductPage(product: product);
        }));
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                    width: double.infinity,
                    child: PictureSelf(product.picture_list["shuffle"][0],
                        product: product))),
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(product.product_name),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Text("24小时发货"),
                          ],
                        ),
//                      Text.rich(textSpan)
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: IconButton(
                          iconSize: 20,
                          color: Colors.white,
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            if (!Provider.of<CartModel>(context)
                                .isExist(product))
                              Provider.of<CartModel>(context).add(product, 1);
                            var snackBar = SnackBar(
                              duration: Duration(seconds: 1),
                              content: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  Text(product.product_name + '已经在购物车躺好等您咯！')
                                ],
                              ),
                              behavior: SnackBarBehavior.floating,
                            );
                            Scaffold.of(context).showSnackBar(snackBar);
                          },
                        )),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        "￥" + product.price["num"].toString(),
                        style: TextStyle(fontSize: 18, color: Colors.redAccent),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  var _future;

  @override
  void initState() {
    String token = Provider.of<UserModel>(context, listen: false).user.token;
    _future = getProductRecommendList(token, quantity: 10);
    super.initState();
  }

  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  _displaySnackBar(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                )),
            actions: <Widget>[
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
                      child: Text("价格"),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Text("销量"),
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
                    Text("价格区间"),
                    Wrap(
                      spacing: 10,
                      children: <Widget>[
                        RawChip(
                          label: Text("data"),
                          selected: false,
                          labelStyle: TextStyle(
//                    color: _selected?Colors.white:Colors.grey[700]
                              ),
                          onSelected: (v) {
                            setState(() {
//                      widget.address.person["sex"] = _key;
                            });
                          },
                          selectedColor: Theme.of(context).primaryColor,
                        ),
                        ChoiceChip(label: Text("水果蔬菜"), selected: true),
                        ChoiceChip(label: Text("水产海鲜"), selected: false),
                        ChoiceChip(label: Text("肉食蛋白"), selected: false),
                        ChoiceChip(label: Text("玉米粮油"), selected: false),
                        ChoiceChip(label: Text("鲜奶乳品"), selected: false),
                      ],
                    )
                  ],
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(onPressed: () {}, child: Text("重置")),
                  FlatButton(onPressed: () {}, child: Text("确定"))
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
        ));
  }
}
