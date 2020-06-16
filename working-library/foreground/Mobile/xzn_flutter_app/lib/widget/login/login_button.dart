import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xzn/page/my/privacy_policy.dart';
import 'package:xzn/page/my/service_policy.dart';

class LoginButtonWidget extends StatelessWidget {

  LoginButtonWidget({Key key, this.validate: false, @required this.onLogin}):super(key:key);

  final validate;
  final onLogin;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width,
            child: FlatButton(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10
              ),
              color: this.validate?Colors.blue:Colors.grey[300],
              highlightColor: Colors.grey[400],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey[100],
              child: Text(
                "同意协议并登录",
                style: TextStyle(
                  fontSize: 20,
                  color: this.validate?Colors.white:Colors.grey[800]
                ),
              ),
              onPressed: this.validate?() {
                onLogin();
              }:() {},
            ),
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
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return ServicePolicy();
                  }));
                },
              ),
              TextSpan(
                text: "与"
              ),
              TextSpan(
                text: "《隐私政策》",
                style: TextStyle(
                  color: Colors.blue
                ),
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return PrivacyPolicy();
                  }));
                },
              ),
            ]
          )),
        ],
      ),
    );
  }
}
