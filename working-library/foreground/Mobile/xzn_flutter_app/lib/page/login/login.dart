import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widget/login/message_code.dart';

import 'password_login.dart';
// TODO: appbar的抬头
class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
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
                  "密码登录",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
              //onTap: () {},
              onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return PasswordLogin();
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
                  "手机号登录",
                  style: TextStyle(fontSize: 40),
                ),
                MessageCodeWidget(),
              ],
            )));
  }
}
