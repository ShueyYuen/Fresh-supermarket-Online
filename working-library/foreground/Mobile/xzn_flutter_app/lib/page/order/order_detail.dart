import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/models/order.dart';
import 'package:xzn/models/product.dart';
import 'package:xzn/page/my/customer_service.dart';
import 'package:xzn/page/order/confirm_order.dart';
import 'package:xzn/page/product/product_show.dart';
import 'package:xzn/services/picture.dart';

class OrderDetail extends StatelessWidget {
  OrderDetail({Key key, @required this.order}) : super(key: key);

  Order order;

  String getSex(String sex) {
    switch (sex) {
      case "M":
        return "先生";
      case "F":
        return "女士";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget placeholder = Image.asset(
      "assets/image/default_picture.webp", //头像占位图，加载过程中显示
    );
    final List<String> order_stat = ["已取消","待付款","已付款","已送达","已完成"];
    print(order.note);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("订单"+order_stat[order.order_status]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.headset_mic),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CustomerService();
                }));
              },
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 60,
                      child: Text(
                        "感谢您对鲜着呢的信任，期待再次光临",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    OutlineButton(
                      onPressed: () {},
                      child: Text("电话联系"),
                    )
                  ],
                )),
            Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                runSpacing: 10,
                children: <Widget>[
                  ...order.product_list.map<Widget>((order_item) {
                    return OrderProductCard(cartItem: order_item,);
//                    return ListTile(
//                      leading: PictureSelf(
//                          order_item.product.picture_list["shuffle"][0],
//                          width: 100,
//                          product: order_item.product),
//                      title: Stack(
//                        children: <Widget>[
//                          Container(
//                            child: Text(
//                              order_item.product.product_name,
//                              style: TextStyle(fontSize: 16),
//                            ),
//                          ),
//                          Positioned(
//                              top: 5,
//                              right: 20,
////                        alignment: Alignment.centerRight,
//                              child: Text(
//                                "x" + order_item.number.toString(),
//                                style: TextStyle(fontSize: 16),
//                              ))
//                        ],
//                      ),
//                      trailing: Text(
//                        "￥" +
//                            (order_item.product.price["num"] *
//                                    order_item.number)
//                                .toStringAsFixed(2),
//                        style: TextStyle(fontSize: 14),
//                      ),
//                      onTap: () {
//                        Navigator.of(context)
//                            .push(MaterialPageRoute(builder: (context) {
//                          return ProductPage(
//                              product: Product.fromJson(
//                                  order_item.product.toJson()));
//                        }));
//                      },
//                    );
                  }),
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
                            "小计  ￥" + order.total_price.toString(),
                            style: TextStyle(fontSize: 18),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                runSpacing: 0,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("配送信息", style: TextStyle(fontSize: 20)),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  ListTile(
                    title: Text("送达时间"),
                    trailing: Text(
                      "尽快送达",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  ListTile(
                    title: Text("收货地址"),
                    trailing: Text(
                      order.address.detail.city +
                          order.address.detail.district +
                          order.address.detail.street +
                          order.address.detail.no +
                          "\n" +
                          order.address.person["consignee"] +
                          getSex(order.address.person["sex"]) +
                          "   " +
                          order.address.phone,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  ListTile(
                    title: Text("配送方式"),
                    trailing: Text(
                      "外卖员配送",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Wrap(
                  runSpacing: 0,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text("订单信息", style: TextStyle(fontSize: 20)),
                    ),
                    Divider(
                      thickness: 1,
                      height: 1,
                    ),
                    ListTile(
                        title: Text("订单号"),
                        trailing: Container(
                            alignment: Alignment(1, 0),
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  order.order_id.toString() + " |",
                                ),
                                Container(
                                    width: 30,
                                    child: FlatButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {},
                                        child: Text(
                                          "复制",
                                          style: TextStyle(
                                              color: Colors.lightBlue),
                                        )))
                              ],
                            ))),
                    Divider(
                      thickness: 1,
                      height: 1,
                    ),
                    ListTile(
                      title: Text("支付方式"),
                      trailing: Text(
                        "鲜着呢支付",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 1,
                    ),
                    ListTile(
                      title: Text("下单时间"),
                      trailing: Text(
                        order.create_order_time.split("+")[0],
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 1,
                    ),
                    ListTile(
                        title: Text("订单备注"),
                        trailing: Container(
                          width: 200,
                          child: Text(
                            order.note ?? "",
                            style: TextStyle(fontSize: 14),
                          ),
                        )),
                  ],
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Stepper(
                          currentStep: 1,
                          controlsBuilder: (BuildContext context,
                              {VoidCallback onStepContinue,
                              VoidCallback onStepCancel}) {
                            return Row(
                              children: <Widget>[],
                            );
                          },
                          steps: <Step>[
                            Step(
                                title: Text('订单提交成功'),
                                subtitle: Text(order.create_order_time),
                                content: SizedBox(
                                  height: 0,
                                ),
                                state: StepState.complete),
                            Step(
                                title: Text('订单已接单'),
                                subtitle: Text(order.receive_order_time),
                                content: Text(order.create_order_time)),
                            Step(
                                title: Text('订单已完成'),
                                subtitle: Text(order.finish_order_time),
                                content: Text('今天是2020-4-25')),
                          ],
                        ),
//                    actions: <Widget>[
//                      FlatButton(child: Text('取消'),onPressed: (){
//                        Navigator.of(context).pop('cancel');
//                      },),
//                      FlatButton(child: Text('确认'),onPressed: (){
//                        Navigator.of(context).pop('confirm');
//                      },),
//                    ],
                      );
                    });
              },
            )
          ],
        ));
  }
}
