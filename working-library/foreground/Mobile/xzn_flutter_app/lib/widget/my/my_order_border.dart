import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/order/order_manage.dart';
import 'package:xzn/services/my_order_service.dart';
import 'package:xzn/widget/my/icon_text_under.dart';

import '../../states/profile_change_notifier.dart';
import '../../models/myOrder.dart';

class MyOrderBorder extends StatefulWidget {
  @override
  _MyOrderBorderState createState() => _MyOrderBorderState();
}

class _MyOrderBorderState extends State<MyOrderBorder> {
  @override
  void initState() {
    getMyOrder(context);
    super.initState();
  }

  @override
  void didUpdateWidget(MyOrderBorder oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    getMyOrder(context);
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = Provider.of<UserModel>(context, listen: true).isLogin;
    MyOrder my_order = Provider.of<MyOrderModel>(context, listen: true).my_order;
    double height = 80;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child:DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0), //3像素圆角
          boxShadow: [
            BoxShadow(
              color:Colors.grey[400],
              offset: Offset(0,2.0),
              blurRadius: 6.0
            )
          ]
        ),
        child:Container(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 350,
                    child: Text(
                      "我的订单",
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 12,
                    child: GestureDetector(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "查看所有订单",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600]
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return OrderManage();
                        }));
                      },
                    ),
                  )
                ],
              ),
              Divider(height: 4.0, thickness: 1.5, color: Colors.blueGrey[100],),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: height,
                      child: IconTextUnder(
                        icon: Icons.account_balance_wallet,
                        text:"待付款",
                        badge: my_order?.unpaid,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return OrderManage(activeIndex: 1,);
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
                        text:"待收货",
                        badge: my_order?.unreceived,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return OrderManage(activeIndex: 2,);
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
                        text:"待评价",
                        badge: my_order?.unevaluated,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return OrderManage(activeIndex: 3,);
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
                        text:"已完成",
                        badge: my_order?.unsend,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return OrderManage(activeIndex: 4,);
                          }));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}