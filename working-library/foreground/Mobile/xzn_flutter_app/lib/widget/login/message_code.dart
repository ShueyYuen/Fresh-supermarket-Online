import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/message_code.dart';
import '../../services/login_service.dart';

class MessageCodeWidget extends StatefulWidget {
  @override
  _MessageCodeState createState() =>  _MessageCodeState();
}

class _MessageCodeState extends State<MessageCodeWidget> {
  Message_code _message_code = Message_code();
  Timer _timer;
  int _countdownTime = 0;
  TextEditingController _phoneController = TextEditingController();

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 50),
      child: Column(
        children: <Widget>[
          Text(_phoneController.text),
          TextField(
            maxLength: 11,
            keyboardType: TextInputType.number,
            controller: _phoneController,
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
                keyboardType: TextInputType.number,
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
                      _countdownTime > 0 ? '$_countdownTime后可重发' : '获取验证码',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[700]
                      ),
                    ),
                    onPressed: _countdownTime > 0 ? null : () async {
                      var result = await getMessageCode() as Message_code;
                      setState(() {
                        _message_code = result;
                        _countdownTime = 60;
                        startTimer();
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
