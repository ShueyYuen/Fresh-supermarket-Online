import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/models/cartItem.dart';
import 'package:xzn/models/product.dart';
import 'package:xzn/page/login/login_choose.dart';
import 'package:xzn/page/order/confirm_order.dart';
import 'package:xzn/services/picture.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/states/profile_change_notifier.dart';
import 'package:xzn/widget/common/flat_icon_button.dart';
import 'package:xzn/widget/product/product_recommend_grid.dart';

import '../../app.dart';

class ProductLittleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image/product.jpg',
      fit: BoxFit.cover,
      height: 200,
    );
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({Key key, @required this.product}) : super(key: key);

  Product product;
  var _productFuture;

  @override
  Widget build(BuildContext context) {
//    Product product = getProductDetails(context) as Product;
    double width = MediaQuery.of(context).size.width;
    double height = width * 900.0 / 1080.0;
    int badge = Provider.of<CartModel>(context, listen: false).is_cart_loaded
        ? Provider.of<CartModel>(context, listen: false).cart.length
        : 0;
    double fontsize = badge > 99 ? 8 : badge > 9 ? 10 : 12;
    return Scaffold(
        appBar:
            PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0)),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: height,
                  child: Swiper(
                    duration: 500,
                    itemCount: product.picture_list["shuffle"]?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 0),
                        child: PictureSelf(
                            product.picture_list["shuffle"][index],
                            width: width,
                            boxFit: BoxFit.cover,
                            product: product),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    autoplay: true,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: FlatIconButton(
                    icon: Icons.arrow_back_ios,
                    backColor: Color.fromARGB(100, 50, 50, 50),
                    size: 30,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: FlatIconButton(
                    icon: Icons.share,
                    backColor: Color.fromARGB(100, 50, 50, 50),
                    size: 30,
                    onTap: () {
                      Share.share(product.product_name);
                    },
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                        width: width,
                        height: 40,
                        color: Colors.blue[100],
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "鲜着呢~正品保障~绝对新鲜~配送全市~售后无忧",
                          style: TextStyle(color: Colors.redAccent),
                        ))),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 20, 10, 5),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.product_name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    product.description["subtitle"],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 1000,
                        padding: EdgeInsets.only(top: 15),
                        child: Text.rich(TextSpan(
                            style: TextStyle(
                                fontSize: 14, color: Colors.redAccent[200]),
                            children: [
                              TextSpan(
                                text: "￥",
                              ),
                              TextSpan(
                                text: product.price["num"].toString(),
                                style: TextStyle(
                                    fontSize: 22, color: Colors.redAccent[200]),
                              ),
                              TextSpan(
                                  text: "/" + product.price["unit"] + "   ",
                                  style: TextStyle(color: Colors.grey[600])),
                              TextSpan(
                                text: "  ￥" +
                                    (product.price["num"] / product.discount)
                                        .toStringAsFixed(2) +
                                    "  ",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ])),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Text(
                          "月销售666件",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              thickness: 10,
            ),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: 50.0,
                    child: Text("配送"),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 50.0,
                    child: Text(product.description["distribution"]),
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 10,
            ),
            product.description["promotipn"] == null
                ? SizedBox(
                    height: 0,
                  )
                : Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: 50.0,
                          child: Text("促销"),
                        ),
                      ),
                      Expanded(
                        child: Chip(
                          backgroundColor: Colors.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                          label: new Text('8.8折'),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.topLeft,
                          height: 50.0,
                          child: Text(product.description["promotipn"]),
                        ),
                      ),
                    ],
                  ),
            product.description["promotipn"] == null
                ? SizedBox(
                    height: 0,
                  )
                : Divider(
                    height: 20,
                    thickness: 10,
                  ),
            // 推荐商品
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "推荐商品",
                    style: TextStyle(fontSize: 16),
                  ),
                  ProductRecommendGrid(),
                ],
              ),
            ),
            Divider(
              height: 20,
              thickness: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "商品详情",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: new Border.all(width: 1, color: Colors.grey[400]),
                    ),
                    child: Table(
                      columnWidths: const {
                        0: FixedColumnWidth(100.0),
                      },
                      border: TableBorder(
                        top: BorderSide(color: Colors.transparent),
                        left: BorderSide(color: Colors.transparent),
                        right: BorderSide(color: Colors.transparent),
                        bottom: BorderSide(color: Colors.transparent),
                        horizontalInside: BorderSide(color: Colors.grey[400]),
                        verticalInside:
                            BorderSide(color: Colors.white, width: 2),
                      ),
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              '产地',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(product.details["origin"],
                                textAlign: TextAlign.left),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              '重量',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                                product.details["weight"].toString() + 'Kg',
                                textAlign: TextAlign.left),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              '保存方式',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(product.details["stockway"],
                                textAlign: TextAlign.left),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  ...product.picture_list["detail"].map((image_link) {
                    return PictureSelf(image_link,
                        product: product,
                        width: width,
                        boxFit: BoxFit.fitWidth);
                  }),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: Builder(
          builder: (context) => Container(
            width: double.infinity,
            height: 55,
            child: Row(
              children: <Widget>[
                Container(
                  height: 55,
                  alignment: Alignment.topCenter,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "app", (Route<dynamic> route) => false,
                          arguments: 2);
                    },
                    child: Stack(
                      alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.topCenter,
                          child: Icon(
                            Icons.shopping_cart,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                        Positioned(
                            top: 10,
                            right: 0,
                            child: badge > 0
                                ? Container(
                                    width: 16,
                                    height: 16,
                                    child: Center(
                                      child: Text(badge.toString(),
                                          style: TextStyle(
                                              fontSize: fontsize,
                                              color: Colors.white)),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: new BorderRadius.all(
                                        const Radius.circular(16.0),
                                      ),
                                    ),
                                  )
                                : Text("")),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Text(""),
                ),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(10)),
                        child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
//                  color: Color.fromARGB(1, 138, 226, 255),
                            color: Theme.of(context).accentColor,
                            textColor: Color.fromARGB(255, 56, 184, 240),
                            onPressed: () async {
                              if (!Provider.of<UserModel>(context).isLogin)
                                Navigator.pushNamed(context, "login");
                              if (!Provider.of<CartModel>(context)
                                  .is_cart_loaded)
                                await getCartProductList(context, "");
                              Provider.of<CartModel>(context).add(product, 1);
                              var snackBar = SnackBar(
                                duration: Duration(seconds: 1),
                                content: Container(
                                  alignment: Alignment.topCenter,
                                  height: 50,
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ),
                                      Text(
                                          product.product_name + '已经在购物车躺好等您咯！')
                                    ],
                                  ),
                                ),
                                behavior: SnackBarBehavior.floating,
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                            child: Text(
                              "加入购物车",
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(10)),
                        child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 28),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () async {
                              if (!Provider.of<UserModel>(context).isLogin)
                                await Navigator.pushNamed(context, "login");
                              if (!Provider.of<CartModel>(context)
                                  .is_cart_loaded)
                                await getCartProductList(context, "");
                              if (Provider.of<UserModel>(context).isLogin)
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return OrderConfirm(
                                    order: [
                                      CartItem.fromJson({
                                        "product": product.toJson(),
                                        "number": 1
                                      })
                                    ],
                                  );
                                }));
                            },
                            child: Text(
                              "立即购买",
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
