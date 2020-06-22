import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/my/setting.dart';
import 'package:xzn/services/picture.dart';
import 'package:xzn/widget/my/my_order_border.dart';
import 'package:xzn/widget/my/operator_list.dart';
import '../states/profile_change_notifier.dart';
import '../models/user.dart';
import 'my/information.dart';

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
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      child: Wrap(
                    children: [
                      Container(
                          constraints: BoxConstraints(minWidth: 300),
                          child: GestureDetector(
                            child: Text(
                              isLogin
                                  ? user.nickname == null
                                      ? user.phone ?? ""
                                      : user.nickname
                                  : "请登录",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: isLogin
                                      ? Colors.black
                                      : Colors.grey[600]),
                            ),
                            onTap: () {
                              if (!Provider.of<UserModel>(context).isLogin) {
                                Navigator.pushNamed(context, "login");
                              } else {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Information();
                                }));
                              }
                            },
                          )),
                      Text(
                        '忙了就不要来买菜做饭了，\n可以去某团看看哦~',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  )),
                  GestureDetector(
                    child: CustomAvatar(context),
                    onTap: () {
                      if (Provider.of<UserModel>(context).isLogin) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Information();
                        }));
                      } else {
                        Navigator.pushNamed(context, "login");
                      }
                    },
                  ),
                ],
              )),
          MyOrderBorder(),
          OperatorList()
        ]));
  }
}
