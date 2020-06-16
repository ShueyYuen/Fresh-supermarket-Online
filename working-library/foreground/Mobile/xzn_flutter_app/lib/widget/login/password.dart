import 'package:flutter/material.dart';
import 'package:xzn/services/login_service.dart';
import 'package:xzn/widget/login/login_button.dart';

class PasswordWidget extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<PasswordWidget> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool validate = false;
  FocusNode focusNode = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
  }

  void _handleLogin() {
    print(_passwordController.text+_passwordController.text);
    Login(context, _phoneController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      autovalidate: true,
      onChanged: () {
        if (_formKey.currentState.validate() && !this.validate) {
          if(null == focusScopeNode){
            focusScopeNode = FocusScope.of(context);
          }
          setState(() {
            this.validate = true;
          });
          focusScopeNode.requestFocus(focusNode);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            maxLength: 11,
            keyboardType: TextInputType.number,
            controller: _phoneController,
            autofocus: true,
            decoration: InputDecoration(
                labelText: "手机号",
                hintText: "请输入手机号",
                prefixIcon: Icon(Icons.person)),
            validator: (value) {
              if (value.length != 11) {
                return "请输入完整的手机号！";
              }
              return null;
            },
          ),
          Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              TextFormField(
                //maxLength: 4,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                focusNode: focusNode,
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value.length <= 8) {
                    return "请输入密码！";
                  }
                  return null;
                },
              ),
            ],
          ),
          LoginButtonWidget(
            validate: this.validate,
            onLogin: _handleLogin,
          ),
        ],
      ),
    );
  }
}
