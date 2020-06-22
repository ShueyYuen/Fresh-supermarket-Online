import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/page/login/login_choose.dart';
import 'package:xzn/page/order/order_manage.dart';
import 'package:xzn/services/order_service.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/widget/my/icon_text_under.dart';

import '../../states/profile_change_notifier.dart';

class MyOrderBorder extends StatefulWidget {
  @override
  _MyOrderBorderState createState() => _MyOrderBorderState();
}

class _MyOrderBorderState extends State<MyOrderBorder> {
  @override
  void initState() {
    getOrderList(context, getToken(context));
    super.initState();
  }

  @override
  void didUpdateWidget(MyOrderBorder oldWidget) {
    super.didUpdateWidget(oldWidget);
    getOrderList(context, getToken(context));
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = Provider.of<UserModel>(context, listen: true).isLogin;
    var order = Provider.of<OrderModel>(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    double height = 80;
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0), //3像素圆角
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400],
                      offset: Offset(0, 2.0),
                      blurRadius: 6.0)
                ]),
            child: Container(
              width: width - 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Title(
                          child: Text(
                            "我的订单",
                            style: TextStyle(fontSize: 18),
                          ),
                          color: Colors.black,
                        ),
                        Expanded(child: Text("")),
                        GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "查看所有订单",
                                    style: TextStyle(color: Colors.grey[600])),
                              ])),
                              Text(
                                "\uE5E1",
                                style: TextStyle(
                                    fontFamily: "MaterialIcons",
                                    fontSize: 16,
                                    color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Provider.of<UserModel>(context).isLogin
                                  ? OrderManage()
                                  : LoginChoose();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 4.0,
                    thickness: 1.5,
                    color: Colors.blueGrey[100],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: height,
                          child: IconTextUnder(
                            icon: Icons.account_balance_wallet,
                            text: "待付款",
                            badge: order?.unpaid,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Provider.of<UserModel>(context).isLogin
                                    ? OrderManage(
                                        activeIndex: 1,
                                      )
                                    : LoginChoose();
                              }));
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: height,
                          child: IconTextUnder(
                            icon: Icons.store,
                            text: "待收货",
                            badge: order?.unreceived,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Provider.of<UserModel>(context).isLogin
                                    ? OrderManage(
                                        activeIndex: 2,
                                      )
                                    : LoginChoose();
                              }));
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: height,
                          child: IconTextUnder(
                            icon: Icons.local_activity,
                            text: "待评价",
                            badge: order?.unconfirm,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Provider.of<UserModel>(context).isLogin
                                    ? OrderManage(
                                        activeIndex: 3,
                                      )
                                    : LoginChoose();
                              }));
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: height,
                          child: IconTextUnder(
                            icon: Icons.gavel,
                            text: "已完成",
                            badge: order?.finished,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Provider.of<UserModel>(context).isLogin
                                    ? OrderManage(
                                        activeIndex: 4,
                                      )
                                    : LoginChoose();
                              }));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
