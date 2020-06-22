import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/models/cartItem.dart';
import 'package:xzn/models/order.dart';
import 'package:xzn/page/order/order_detail.dart';
import 'package:xzn/services/order_service.dart';
import 'package:xzn/services/picture.dart';
import 'package:xzn/states/profile_change_notifier.dart';

class OrderCard extends StatelessWidget {
  OrderCard({Key key, @required this.order, this.onUpdate: null})
      : super(key: key);
  Function onUpdate;
  Order order;
  final List<String> tags = ["", "待付款", "待收货", "待评价", "已完成"];

  totalPrice() {
    double price = 10.0;
    for (CartItem cartItem in order.product_list) {
      price += cartItem.number *
          cartItem.product.price["num"] *
          cartItem.product.discount;
    }
    return price.toStringAsFixed(2);
  }

  totalPriceDouble() {
    double price = 10.0;
    for (CartItem cartItem in order.product_list) {
      price += cartItem.number *
        cartItem.product.price["num"] *
        cartItem.product.discount;
    }
    return price;
  }

  String truncateName(Order order) {
    String result = "";
    for (var product_item in order.product_list) {
      result += product_item.product.product_name +
          "*" +
          product_item.number.toString() +
          "  ";
      if (result.length > 15) {
        result = result.substring(0, 15) + "···";
        break;
      }
    }
    result = result == "" ? "没有任何商品，给送运费！" : result;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 30;
    Widget placeholder = Image.asset(
      "assets/image/default_picture.webp", //头像占位图，加载过程中显示
      width: width - 245,
      height: 90,
    );
    Widget subbutton = this.order.order_status == 1
        ? OutlineButton(
            highlightColor: Colors.blue[700],
            splashColor: Colors.grey,
            child: Text(
              "去付款",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () async {
              await showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                builder: (BuildContext context) {
                  return Scaffold(
                      body: Builder(
                          builder: (context) => Container(
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
                                          if (await xznpay(
                                              context, order.order_id)) {
                                            double money = Provider.of<UserModel>(context).user.money;
                                            Provider.of<UserModel>(context).user.money = money - totalPriceDouble();
                                            onUpdate();
                                            Navigator.of(context).pop();
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
                                                  Provider.of<UserModel>(
                                                          context)
                                                      .user
                                                      .money
                                                      .toStringAsFixed(2),
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
                                              fontSize: 20,
                                              color: Colors.white),
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
                                              fontSize: 20,
                                              color: Colors.white),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 50),
                                      child: Text("坚定只近不出！"),
                                    )
                                  ],
                                ),
                              )));
                },
              );
              onUpdate();
            },
          )
        : this.order.order_status == 2
            ? OutlineButton(
                highlightColor: Colors.blue[700],
                splashColor: Colors.grey,
                child: Text(
                  "确认收货",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () async {
                  await confirmGoods(context, this.order.order_id);
                  onUpdate();
                },
              )
            : this.order.order_status == 3
                ? OutlineButton(
                    highlightColor: Colors.blue[700],
                    splashColor: Colors.grey,
                    child: Text(
                      "去评价",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {},
                  )
                : Text("");
    // TODO: 同步显示
    Widget rightbutton = this.order.order_status == 1
        ? OutlineButton(
            highlightColor: Colors.blue[700],
            splashColor: Colors.grey,
            child: Text(
              "取消订单",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () async {
              await cancelOrder(context, this.order.order_id);
              onUpdate();
            },
          )
        : OutlineButton(
            highlightColor: Colors.blue[700],
            splashColor: Colors.grey,
            child: Text(
              "再来一份",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {},
          );
    return Container(
        height: 140,
        width: width,
//      width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Text(truncateName(order)),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(tags[order.order_status]),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
              height: 5,
            ),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                    flex: 0,
                    child: order.product_list.length == 0
                        ? Image.asset(
                            "assets/image/default_picture.webp",
                            height: 90,
                            width: width - 245,
                            fit: BoxFit.cover,
                          )
                        : PictureSelf(
                            order.product_list[0].product
                                .picture_list["shuffle"][0],
                            product: order.product_list[0].product,
                            boxFit: BoxFit.cover,
                            width: width - 245,
                            height: 90,
                            placeholder: placeholder)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("下单时间：" +
                                order.create_order_time.substring(0, 16)),
                            Text("总价：￥" + totalPrice()),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              height: 35,
                              alignment: Alignment.bottomRight,
                              child: ButtonBar(
                                buttonPadding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 5),
                                children: <Widget>[
                                  subbutton,
                                  OutlineButton(
                                    highlightColor: Colors.blue[700],
                                    splashColor: Colors.grey,
                                    child: Text(
                                      "查看订单",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return OrderDetail(order: order);
                                      }));
                                    },
                                  ),
                                  rightbutton
                                ],
                              )))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
