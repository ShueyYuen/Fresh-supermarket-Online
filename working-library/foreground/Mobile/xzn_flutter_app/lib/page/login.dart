import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
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
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
              child: Text(
                "密码登录",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18
                ),
              ),
            ),
            onTap: () {
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
              style: TextStyle(
                fontSize: 40
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 50),
              child: Column(
                children: <Widget>[
                  TextField(
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "手机号",
                      hintText: "请输入手机号",
                      prefixIcon: Icon(Icons.person)
                    ),
                  ),
                  Stack(
                    alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
                    children: <Widget>[
                      TextField(
                        maxLength: 10,
                        decoration: InputDecoration(
                          labelText: "验证码",
                          hintText: "请输入验证码",
                          prefixIcon: Icon(Icons.send),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 110, //宽度尽可能大
                            maxHeight: 25.0 //最小高度为50像素
                          ),
                          child: OutlineButton(
                            child: Text(
                              "获取验证码",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700]
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(
                horizontal: 115,
                vertical: 10
              ),
              color: Colors.grey[300],
              highlightColor: Colors.grey[400],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey[100],
              child: Text(
                "同意协议并登录",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[800]
                ),
              ),
              onPressed: () {
              },
            ),
            Text.rich(TextSpan(
              style: TextStyle(
                fontSize: 12
              ),
              children: [
                TextSpan(
                  text: "已阅读并同意"
                ),
                TextSpan(
                  text: "《用户服务协议》",
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),
                TextSpan(
                  text: "与"
                ),
                TextSpan(
                  text: "《隐私政策》",
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),
              ]
            ))
          ],
        )
      )
    );
  }
}