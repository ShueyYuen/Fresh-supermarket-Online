import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widget/login/message_code.dart';

import 'login.dart';

class PasswordLogin extends StatefulWidget {
  @override
  _PasswordLoginState createState() => new _PasswordLoginState();
}

class _PasswordLoginState extends State<PasswordLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.clear, color: Colors.grey[600]), //自定义图标
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Text(
                  "手机号登陆",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
            ),
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "密码登录",
                  style: TextStyle(fontSize: 40),
                ),
                PasswordWidget(),
              ],
            )));
  }
}
