import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:xzn/conf/config.dart';
import 'package:xzn/services/picture.dart';
import 'package:xzn/widget/my/my_order_border.dart';
import 'package:xzn/widget/my/operator_list.dart';
//import '../common/global.dart';
import '../states/profile_change_notifier.dart';
import '../models/user.dart';

class My extends StatefulWidget {
  @override
  _MyState createState() => new _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    bool isLogin = Provider.of<UserModel>(context, listen: true).isLogin;
    User user = Provider.of<UserModel>(context, listen: true).user;
    return Scaffold(
        appBar: AppBar(
          title: Text("我的"),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            constraints:
                BoxConstraints(minWidth: double.infinity, minHeight: 100),
            child: Stack(
              children: <Widget>[
                Wrap(
                  direction: Axis.vertical,
                  spacing: 1.0, // 主轴(水平)方向间距
                  runSpacing: 4.0, // 纵轴（垂直）方向间距
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints(minWidth: 300),
                          child: Text(
                            isLogin ? user.nickname : "请登录",
                            style: TextStyle(
                                fontSize: 28,
                                color:
                                    isLogin ? Colors.black : Colors.grey[600]),
                          ),
                        ),
                        Positioned(
                          right: 0.0,
                          bottom: 0.0,
                          child: GestureDetector(
                            child: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "login");
                            },
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '忙了就不要来买菜做饭了，\n可以去某团看看哦~',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: GestureDetector(
                    child: CustomAvatar(context),
                    onTap: () {
                      print(isLogin);
                      Navigator.pushNamed(context, "login");
                    },
                  ),
                ),
              ],
            ),
          ),
          MyOrderBorder(),
          OperatorList()
        ]));
  }
}
