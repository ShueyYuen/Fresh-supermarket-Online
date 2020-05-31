import 'dart:async';

import 'package:flutter/material.dart';

import '../../services/login_service.dart';
import 'login_button.dart';

class CountDownButton extends StatefulWidget {
  CountDownButton({Key key, this.text_controller,})
    : super(key: key);

  final TextEditingController text_controller;
  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDownButton> {
  Timer _timer;
  int _countdownTime = 0;

  void startTimer() {
    _timer = new Timer.periodic(
      new Duration(seconds: 1),
        (Timer timer) => setState(
          () {
          if (_countdownTime < 1) {
            _timer?.cancel();
          } else {
            _countdownTime = _countdownTime - 1;//自减一
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 110, //宽度尽可能大
          maxHeight: 25.0 //最小高度为50像素
        ),
        child: OutlineButton(
          child: Text(
            _countdownTime > 0 ? '$_countdownTime后可重发' : '获取验证码',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700]
            ),
          ),
          onPressed: _countdownTime > 0 ? null : () async {
            await getMessage_code(widget.text_controller.text);
            setState(() {
              _countdownTime = 60;
              startTimer();
            });
          },
        ),
      ),
    );
  }
}

class MessageCodeWidget extends StatefulWidget {
  @override
  _MessageCodeState createState() =>  _MessageCodeState();
}

class _MessageCodeState extends State<MessageCodeWidget> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  bool validate = false;

  @override
  void initState() {
    super.initState();
  }

  void _handleLogin() {
    Login(context, _phoneController.text, code: _codeController.text);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      autovalidate: true,
      onChanged: () {
        if (_formKey.currentState.validate()) {
          setState(() {
            this.validate = true;
          });
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
                prefixIcon: Icon(Icons.person)
            ),
            validator: (value) {
              if (value.length != 11) {
                return "请输入完整的手机号！";
              }
              return null;
            },
          ),
          Stack(
            alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              TextFormField(
                maxLength: 4,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "验证码",
                  hintText: "请输入验证码",
                  prefixIcon: Icon(Icons.send),
                ),
                controller: _codeController,
                validator: (value) {
                  if (value.length != 4) {
                    return "请输入验证码！";
                  }
                  return null;
                },
              ),
              CountDownButton(text_controller: _phoneController,),
            ],
          ),
          LoginButtonWidget(validate: validate, onLogin: _handleLogin,),
        ],
      ),
    );
  }
}