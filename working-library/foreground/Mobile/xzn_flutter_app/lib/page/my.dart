import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import '../common/global.dart';
import '../states/profile_change_notifier.dart';

class My extends StatefulWidget {
  @override
  _MyState createState() => new _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: 100
          ),
          child: Stack(
            children: <Widget>[
              Wrap(
                direction: Axis.vertical,
                spacing: 1.0, // 主轴(水平)方向间距
                runSpacing: 4.0, // 纵轴（垂直）方向间距
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(
                          minWidth: 300
                        ),
                        child: Text(
                          "JOANNNA",
                          style: TextStyle(
                            fontSize: 28
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0.0,
                        bottom: 0.0,
                        child: GestureDetector(
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                            size: 20,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "login");
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '忙了就不要来买菜做饭了，\n可以去某团看看哦~',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0.0,
                bottom: 0.0,
                child: GestureDetector(
                  child: ClipOval(
                    child: Image.asset(
                      "assets/image/avatar.jpg",
                      width: 70,
                      fit: BoxFit.fill,
                    ),
                  ),
                  onTap: () {
                    print(Provider.of<UserModel>(context, listen: false).isLogin);
                    Navigator.pushNamed(context, "login");
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child:DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
//            gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
              borderRadius: BorderRadius.circular(10.0), //3像素圆角
              boxShadow: [
                BoxShadow(
                  color:Colors.grey[400],
                  offset: Offset(0,2.0),
                  blurRadius: 6.0
                )
              ]
            ),
            child:Container(
              width: 360,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                        child: Text(
                          "我的订单",
                          style: TextStyle(
                            fontSize: 18
                          ),
                        )
                      )
                    ],
                  )
                ],
              ),
            )
          )
        ),
        FlatButton(onPressed: () {
          Provider.of<UserModel>(context, listen: false).user = null;
        }, child: Text("退出登录"))
      ],
    );
  }
}