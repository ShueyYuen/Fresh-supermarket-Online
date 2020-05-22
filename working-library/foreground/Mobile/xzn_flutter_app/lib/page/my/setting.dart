import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/page/my/account_safe.dart';
import 'package:xzn/page/my/privacy.dart';

import '../../models/user.dart';
import '../../states/profile_change_notifier.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserModel>(context, listen: true).user;
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Title(color: Colors.black, child: Text("账户与安全")),
            trailing: Icon(Icons.arrow_forward_ios),
            subtitle: Title(
                color: Colors.grey,
                child: Text(user == null ? "尚未登录" : user.nickname)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AccountSafe();
              }));
            },
          ),
          ListTile(
            title: Title(color: Colors.black, child: Text("隐私")),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Privacy();
              }));
            },
          ),
          ListTile(
            title: Title(color: Colors.black, child: Text("意见反馈")),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Title(color: Colors.black, child: Text("版本检测")),
            trailing: Icon(Icons.arrow_forward_ios),
            subtitle: Title(color: Colors.grey, child: Text("已是最新版本")),
            onTap: () {},
          ),
          ListTile(
            title: Title(color: Colors.black, child: Text("清除缓存")),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Text(
                  "退出登录",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
                Provider.of<UserModel>(context, listen: false).user = null;
                Provider.of<MyOrderModel>(context, listen: false).my_order =
                    null;
                Provider.of<CartModel>(context, listen: false).cart = null;
              },
            ),
          )
        ],
      ),
    );
  }
}
