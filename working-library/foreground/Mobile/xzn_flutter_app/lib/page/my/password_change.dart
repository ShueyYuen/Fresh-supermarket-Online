import 'package:flutter/material.dart';
import 'package:xzn/services/information_service.dart';

class PasswordChange extends StatefulWidget {
  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passController;
  TextEditingController _newController;
  TextEditingController _reController;
  @override
  void initState() {
    _passController = TextEditingController();
    _newController = TextEditingController();
    _reController = TextEditingController();
    super.initState();
  }

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
              autovalidate: true,
              child: Wrap(
                runSpacing: 15,
                children: <Widget>[
                  TextFormField(
                    controller: _passController,
                    obscureText: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "请输入当前登录密码",
                    ),
                  ),
                  TextFormField(
                    controller: _newController,
                    obscureText: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "请输入新密码",
                    ),
                  ),
                  TextFormField(
                    controller: _reController,
                    obscureText: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "确认新密码",
                    ),
                    validator: (value) {
                      if (_reController.text != _newController.text)
                        return "请输入一样的密码";
                      return null;
                    },
                  ),
                  Text(
                    "必须是6-20个英文字母、数字或符号（除空格），且字母、数字、符号至少包含两种",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 90),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      onPressed: () {
                        updateInformation(context,
                            password: _newController.text,
                            original_password: _passController.text);
                      },
                      child: Text(
                        "确定",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            )));
  }
}
