import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/index.dart';
import 'package:xzn/models/address.dart';
import 'package:xzn/models/cartItem.dart';
import 'package:xzn/page/address/address_edit.dart';
import 'package:xzn/page/address/address_select.dart';
import 'package:xzn/page/order/order_manage.dart';
import 'package:xzn/services/address_service.dart';
import 'package:xzn/services/order_service.dart';
import 'package:xzn/services/picture.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/states/profile_change_notifier.dart';

class OrderProductCard extends StatelessWidget {
  OrderProductCard({Key key, @required this.cartItem});

  CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: PictureSelf(cartItem.product.picture_list["shuffle"][0],
            product: cartItem.product, width: 100, boxFit: BoxFit.cover),
        title: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Text(
                cartItem.product.product_name,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
                flex: 1,
                child: Text(
                  "x" + cartItem.number.toString(),
                  style: TextStyle(fontSize: 16),
                )),
          ],
        ),
        trailing: Container(
          width: 50,
          child: Text(
            "￥" + cartItem.product.price["num"].toString(),
            style: TextStyle(fontSize: 14),
          ),
        ));
  }
}

class OrderConfirm extends StatefulWidget {
  OrderConfirm({Key key, @required this.order}) : super(key: key);

  List<CartItem> order;

  @override
  _OrderConfirmState createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  bool protect = false;
  Address address = null;
  String order_id;
  var _future;

  totalPrice() {
    double price = 10.0;
    for (CartItem cartItem in widget.order) {
      price += cartItem.number * cartItem.product.price["num"];
    }
    return price.toStringAsFixed(2);
  }

  totalPriceDouble() {
    double price = 10.0;
    for (CartItem cartItem in widget.order) {
      price += cartItem.number * cartItem.product.price["num"];
    }
    return price;
  }

  String getSex(String sex) {
    switch (sex) {
      case "M":
        return "(先生)";
      case "F":
        return "(女士)";
      default:
        return "";
    }
  }

  @override
  void initState() {
    super.initState();
    _future = getAddressList(context, getToken(context));
    try {
      address = Provider.of<AddressModel>(context, listen: false).address[0];
    } catch (e) {
      address = null;
    }
    print(address.toJson());
  }

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now().add(Duration(minutes: 30));
    return Scaffold(
        appBar: AppBar(
          title: Text("确认订单"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                color: Colors.amber[100],
                child: Row(
                  children: <Widget>[
                    Icon(Icons.volume_up),
                    Text("为减少接触，降低奉献。请修改下方备注"),
                  ],
                )),
            FutureBuilder(
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
                    Address address_sub = address ??
                        (snapshot.data.length == 0 ? null : snapshot.data[0]);
                    widget = address_sub == null
                        ? ListTile(
                            title: Text("还没有任何地址，点击添加"),
                            trailing: Icon(Icons.arrow_forward_ios),
                            onTap: () async {
                              var result = await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AddressEdit(
                                  edit: false,
                                );
                              })) as Address;
                              setState(() {
                                address = result ?? address;
                              });
                            },
                          )
                        : ListTile(
                            title: Text(address_sub.detail.city +
                                address_sub.detail.district +
                                address_sub.detail.street +
                                address_sub.detail.no),
                            trailing: Icon(Icons.arrow_forward_ios),
                            subtitle: Text(address_sub.person["consignee"] +
                                getSex(address_sub.person["sex"]) +
                                " " +
                                address_sub.phone.replaceRange(
                                    3, address_sub.phone.length - 3, "******")),
                            onTap: () async {
                              var result = await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AddressSelect();
                              })) as Address;
                              setState(() {
                                address = result ?? address;
                              });
                            },
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
            ),
            Divider(
              height: 1,
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              title: Text(
                "立即送出",
                style: TextStyle(fontSize: 14),
              ),
              trailing: Text(
                "约" + now.hour.toString() + ":" + now.minute.toString() + "送达",
                style: TextStyle(fontSize: 14, color: Colors.blue[400]),
              ),
            ),
            Divider(
              height: 1,
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              title: Text(
                "支付方式",
                style: TextStyle(fontSize: 14),
              ),
              trailing: Text(
                "鲜着呢支付",
                style: TextStyle(fontSize: 14, color: Colors.blue[400]),
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                runSpacing: 20,
                children: <Widget>[
                  ...widget.order.map((order_item) {
                    return OrderProductCard(cartItem: order_item);
                  }).toList(),
                  ListTile(
                    leading: SizedBox(
                      width: 100,
                      child: Center(
                        child: Container(
                          color: Colors.indigo[100],
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "配送费",
                            style: TextStyle(
                                color: Colors.indigo[900], fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    title: Text("外卖员配送"),
                    trailing: Container(
                      width: 50,
                      child: Text(
                        "￥10.0",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "金额说明",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              Icons.help,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          right: 20,
                          child: Text(
                            "小计  ￥" + totalPrice(),
                            style: TextStyle(fontSize: 18),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: <Widget>[
                  Title(
                    child: Text(
                      "订单备注",
                      style: TextStyle(fontSize: 14),
                    ),
                    color: Colors.black,
                  ),
                  Expanded(child: Text("")),
                  Row(
                    children: <Widget>[
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "可选择无接触配送",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ])),
                      Text(
                        "\uE5E1",
                        style: TextStyle(
                            fontFamily: "MaterialIcons",
                            fontSize: 14,
                            color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
                title: Text(
                  "号码保护",
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text("不知道是啥，反正设计在这！！！"),
                trailing: Switch(
                    value: protect,
                    onChanged: (value) {
                      setState(() {
                        protect = value;
                      });
                    })),
            Container(
              height: 100,
              color: Colors.grey[200],
              child: Text(""),
            )
          ],
        ),
        bottomSheet: Container(
          height: 50,
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 100,
                    color: Colors.grey[800],
                    child: Text.rich(TextSpan(
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        children: [
                          TextSpan(
                              text: "￥" + totalPrice() + " ",
                              style: TextStyle(fontSize: 18)),
                          TextSpan(
                            text: "| 已优惠" + "￥0.00",
                          ),
                        ])),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Color.fromARGB(255, 89, 209, 120),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "去支付",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () async {
                        List<String> orders = List<String>();
//                        for (CartItem cartItem in widget.order) {
//                          orders.add(cartItem.product.product_id);
//                        }
                        String id = await submitOrder(
                            context,
                            getToken(context),
                            widget.order,
                            address,
                            protect,
                            "就是这个备注",
                            totalPriceDouble());
                        print(id);
                        setState(() {
                          order_id = id;
                        });
                        await showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 25),
                              child: ListView(
//                            crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "选择支付方式：",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      color: Colors.redAccent,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      onPressed: () async {
                                        if (await xznpay(context,
                                            int.parse(this.order_id))) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return OrderManage();
                                            }),
                                          );
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            "鲜着呢支付",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "余额：" +
                                                Provider.of<UserModel>(context)
                                                    .user
                                                    .money
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      color: Colors.lightGreen,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      onPressed: () {},
                                      child: Text(
                                        "微信支付",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      color: Colors.blue,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      onPressed: () {},
                                      child: Text(
                                        "支付宝支付",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: Text("坚定只近不出！"),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  ))
            ],
          ),
        ));
  }
}
