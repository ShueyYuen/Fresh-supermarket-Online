import 'package:flutter/material.dart';
import '../widget/home/swiper.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SwiperWidget(),
        ],
      ),
    );
  }
}