import 'package:flutter/material.dart';

class CustomerService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("不要扫码，谢谢合作"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Image.asset("assets/image/qrcode.webp"),
        ),
      ),
    );
  }
}