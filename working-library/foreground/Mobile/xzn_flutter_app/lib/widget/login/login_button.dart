import 'package:flutter/material.dart';

class LoginButtonWidget extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
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
          )),
        ],
      ),
    );
  }
}