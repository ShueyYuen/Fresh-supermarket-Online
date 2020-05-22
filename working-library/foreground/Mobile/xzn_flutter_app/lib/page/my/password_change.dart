import 'package:flutter/material.dart';

import '../order/confirm_order.dart';

class PasswordChange extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("修改密码"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Wrap(
            runSpacing: 15,
            children: <Widget>[
              TextFormField(
//                    maxLength: 11,
                keyboardType: TextInputType.number,
//                    controller: _phoneController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "请输入当前登录密码",
                ),
                validator: (value) {
                  if (value.length != 11) {
                    return "请输入完整的手机号！";
                  }
                  return null;
                },
              ),
              TextFormField(
//                    maxLength: 11,
                keyboardType: TextInputType.number,
//                    controller: _phoneController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "请输入新密码",
                ),
                validator: (value) {
                  if (value.length != 11) {
                    return "请输入完整的手机号！";
                  }
                  return null;
                },
              ),
              TextFormField(
//                    maxLength: 11,
                keyboardType: TextInputType.number,
//                    controller: _phoneController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "确认新密码",
                ),
                validator: (value) {
                  if (value.length != 11) {
                    return "请输入完整的手机号！";
                  }
                  return null;
                },
              ),
              Text("必须是6-20个英文字母、数字或符号（除空格），且字母、数字、符号至少包含两种", style: TextStyle(color: Colors.grey),),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  onPressed: () {},
                  child: Text("确定",style: TextStyle(color: Colors.white,fontSize: 18),),
                  color: Colors.blue,
                ),
              )
            ],
          ),
        )
      )
    );
  }
}