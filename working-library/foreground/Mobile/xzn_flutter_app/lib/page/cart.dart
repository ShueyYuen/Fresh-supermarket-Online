import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/models/cartItem.dart';
import 'package:xzn/page/order/confirm_order.dart';
import 'package:xzn/services/cart_service.dart';
import 'package:xzn/services/picture.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/states/profile_change_notifier.dart';
import 'package:xzn/widget/cart/cart_recommend.dart';
import '../widget/common/num_contoller.dart';
import 'product/product_show.dart';

class ProductCartCard extends StatelessWidget {
  ProductCartCard(
      {Key key,
      this.selected: false,
      @required this.cartItem,
      @required this.onDelete,
      @required this.onSelect})
      : super(key: key);
  bool selected;
  Function onSelect;
  Function onDelete;
  CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(Random().nextInt(1000000).toString()),
        confirmDismiss: (DismissDirection direction) async {
          // 删除确认
          return true;
        },
        onDismissed: (DismissDirection direction) {
//          print('onDismissed:$direction');
//          print("滑动回调！！");
          onDelete(cartItem.product.product_id);
        },
        child: Container(
          height: 130,
          child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductPage(
                    product: cartItem.product,
                  );
                }));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
//                    Expanded(
//                      flex: 0,
//                      child:
                  SizedBox(
                    width: 30,
                    child: Checkbox(
                      value: this.selected,
                      onChanged: (value) {
                        onSelect(cartItem.product.product_id);
                      },
                      focusColor: Theme.of(context).primaryColor,
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ),
//                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        padding: EdgeInsets.only(right: 10),
                        child: PictureSelf(
                            cartItem.product.picture_list["shuffle"][0],
                            product: cartItem.product,
                            width: 110,
                            height: 90,
                            boxFit: BoxFit.cover
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 75,
                            child: Title(
                                color: Colors.black,
                                child: Text(
                                  cartItem.product.product_name,
                                  style: TextStyle(fontSize: 17),
                                )),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Text.rich(TextSpan(
                                style: TextStyle(
                                    fontSize: 14, color: Colors.redAccent[200]),
                                children: [
                                  TextSpan(
                                    text: "￥",
                                  ),
                                  TextSpan(
                                    text: (cartItem.product.price["num"] * cartItem.product.discount).toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.redAccent[200]),
                                  ),
                                  TextSpan(
                                      text: "/" +
                                          cartItem.product.details["weight"].toString()+cartItem.product.price["unit"] +
                                          "   ",
                                      style:
                                          TextStyle(color: Colors.grey[600])),
                                ])),
                          ),
                          Positioned(
                              right: 10,
                              bottom: 0,
                              child: NumberControllerWidget(
                                height: 20,
                                width: 30,
                                iconWidth: 20,
                                numText: cartItem.number.toString(),
                                addValueChanged: (num) {
                                  print("addvaluechanged:$num");
                                },
                                removeValueChanged: (num) {
                                  print("removevaluechange:$num");
                                },
                                updateValueChanged: (num) async {
                                  if (num != 0) {
                                    cartItem.number = num;
                                    updateCart(context, cartItem);
                                  } else {
                                    bool result = await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('提示'),
                                            content: Text('确认将  ' +
                                                cartItem.product.product_name +
                                                "  移出购物车嘛？"),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('取消'),
                                                onPressed: () {
                                                  Navigator.of(context).pop(false);
                                                },
                                              ),
                                              FlatButton(
                                                child: Text('确认'),
                                                onPressed: () {
                                                  onDelete(cartItem
                                                      .product.product_id);
                                                  cartItem.number = num;
                                                  updateCart(context, cartItem);
                                                  Navigator.of(context).pop(true);
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                    print(num);
                                  }
                                },
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}

class Cart extends StatefulWidget {
  @override
  _CartState createState() => new _CartState();
}

class _CartState extends State<Cart> {
  bool selectAll = false;
  var _future;
  List<String> selected = List<String>();

  _handleSelect(String product_id) {
    setState(() {
      if (selected.indexOf(product_id) == -1) {
        selected.add(product_id);
      } else {
        selected.remove(product_id);
      }
      if (selected.length !=
          Provider.of<CartModel>(context, listen: false).cart_count) {
        this.selectAll = false;
      } else {
        this.selectAll = true;
      }
    });
  }

  _handleDelete(String product_id) async {
    await updateCart(
        context,
        CartItem.fromJson({
          "product": Provider.of<CartModel>(context, listen: false)
              .getProductById(product_id)
              .toJson(),
          "number": 0
        }));
  }

  _totalPrice() {
    double price = 10.0;
    var cart = Provider.of<CartModel>(context, listen: false).cart;
    if (cart != null) {
      for (CartItem cartItem in cart) {
        if (selected.indexOf(cartItem.product.product_id) != -1) {
          price += cartItem.product.price["num"] * cartItem.number* cartItem.product.discount;
        }
      }
    }
    String prices = price.toStringAsFixed(2);
    return [
      prices.substring(0, prices.length - 2),
      prices.substring(prices.length - 2)
    ];
  }

  @override
  void initState() {
    super.initState();
    _future = getCartProductList(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget recommend = Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(flex: 2, child: Text("")),
                        Expanded(
                            flex: 2,
                            child: Divider(
                              thickness: 5,
                              color: Colors.green[100],
                            )),
                        Container(
                              alignment: Alignment.center,
                              child: Text("为您推荐"),
                            ),
                        Expanded(
                            flex: 2,
                            child: Divider(
                              thickness: 5,
                              color: Colors.green[100],
                            )),
                        Expanded(flex: 2, child: Text("")),
                      ],
                    );
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.white,
              ),
              onPressed: () async {
                for (String product_id in this.selected) {
                  _handleDelete(product_id);
                }
                setState(() {
                  this.selected.clear();
                });
              })
        ],
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          var widget;
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              print(snapshot.hasError);
              widget = Icon(
                Icons.error,
                color: Colors.red,
                size: 48,
              );
            } else {
//              print(DemoLocalizations.of(context).title);
            print("我来做Widget");
              if (Provider.of<UserModel>(context).isLogin)
                widget = ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  shrinkWrap: true,
                  children: <Widget>[
                    ...snapshot.data.map((cartItem) {
                      return ProductCartCard(
                        cartItem: cartItem,
                        selected: this
                                .selected
                                .indexOf(cartItem.product.product_id) !=
                            -1,
                        onSelect: _handleSelect,
                        onDelete: _handleDelete,
                      );
                    }),
                    snapshot.data.length == 0?Image.asset("assets/image/no_login.webp"):SizedBox(height: 0,),
                    recommend,
                    CartRecommend(onUpdate: () {
                      setState(() {

                      });
                    },),
                    SizedBox(
                      height: 30,
                    )
                  ],
                );
              else
                widget = ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  shrinkWrap: true,
                  children: <Widget>[
                    Image.asset("assets/image/no_login.webp"),
                    recommend,
                    CartRecommend(),
                    SizedBox(
                      height: 30,
                    )
                  ],
                );
            }
          } else {
            widget = Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ));
          }
          return widget;
        },
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 40,
//        color: Colors.black,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Checkbox(
                value: this.selectAll,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  setState(() {
                    this.selectAll = value;
                    if (this.selectAll) {
                      for (CartItem cartItem
                          in Provider.of<CartModel>(context, listen: false)
                              .cart) {
                        if (selected.indexOf(cartItem.product.product_id) == -1)
                          selected.add(cartItem.product.product_id);
                      }
                    } else {
                      selected.clear();
                    }
                  });
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Text("全选"),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text.rich(TextSpan(
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    children: [
                      TextSpan(
                        text: "运费￥",
                      ),
                      TextSpan(
                        text: "10",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextSpan(text: ".00" + "   "),
                      TextSpan(
                        text: "合计￥",
                      ),
                      TextSpan(
                        text: _totalPrice()[0],
                        style: TextStyle(
                            fontSize: 18, color: Colors.redAccent[200]),
                      ),
                      TextSpan(
                          text: _totalPrice()[1],
                          style: TextStyle(color: Colors.redAccent[200])),
                    ])),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  child: Text("去结算"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    List<CartItem> cart = Provider.of<CartModel>(context).cart;
                    List<CartItem> order = List<CartItem>();
                    for (CartItem cartItem in cart) {
                      if (selected.indexOf(cartItem.product.product_id) != -1)
                        order.add(cartItem);
                    }
                    if (order.length != 0) Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return OrderConfirm(
                        order: order,
                      );
                    }));
                    else {
                      var snackBar = SnackBar(
                        duration: Duration(seconds: 1),
                        content: Row(
                          children: <Widget>[
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            Text("还没有选择任何商品")
                          ],
                        ),
                        behavior: SnackBarBehavior.fixed,
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
