import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'password_login.dart';

class LoginChoose extends StatefulWidget {
  @override
  _LoginChooseState createState() => new _LoginChooseState();
}

class _LoginChooseState extends State<LoginChoose> {
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
        title: Text("注册"),
      ),
      body: Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 15.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Image.asset(
                "assets/image/login_logo.webp",
                fit: BoxFit.fitWidth,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 140, vertical: 10),
              color: Colors.lightGreen[600],
              highlightColor: Colors.lightGreen[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey[100],
              child: Text(
                "微信登录",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {},
            ),
            OutlineButton(
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
              splashColor: Colors.lightGreen[100],
              child: Text(
                "手机号登录",
                style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
            ),
            OutlineButton(
              padding: EdgeInsets.symmetric(horizontal: 140, vertical: 10),
              splashColor: Colors.lightGreen[100],
              child: Text(
                "密码登录",
                style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PasswordLogin();
                }));
              },
            )
          ]),
    );
  }
}
