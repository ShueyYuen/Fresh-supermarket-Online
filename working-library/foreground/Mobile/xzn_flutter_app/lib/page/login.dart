import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/login/login_button.dart';
import '../widget/login/message_code.dart';
//import 'package:flutter_redux/flutter_redux.dart';
//import 'package:redux/redux.dart';
//import '../states/app_store.dart';

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
//            StoreConnector<int, String>(builder: (context, value) {
//              return Text(value, style: Theme.of(context).textTheme.display1);
//            }, converter: (Store store) {
//              return store.state.toString();
//            }),
            Text(
              "手机号登录",
              style: TextStyle(
                fontSize: 40
              ),
            ),
            MessageCodeWidget(),
            LoginButtonWidget()
//            StoreConnector<int, VoidCallback>(
//              converter: (Store store) {
//                return () => store.dispatch(StatesAction.Increment); //发送数据
//              },
//              builder: (BuildContext context, VoidCallback callback) {
//                return FloatingActionButton(
//                  onPressed: callback, child: Icon(Icons.add));
//              },
//            ),
          ],
        )
      )
    );
  }
}