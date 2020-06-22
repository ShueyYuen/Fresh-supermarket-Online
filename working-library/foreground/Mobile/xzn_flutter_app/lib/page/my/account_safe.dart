import 'package:flutter/material.dart';
import 'package:xzn/page/my/password_change.dart';

import '../order/confirm_order.dart';

class AccountSafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("账户安全"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Title(color: Colors.black, child: Text("登录密码")),
            trailing: Container(
              alignment: Alignment.centerRight,
              width: 55,
              height: 20,
              child: Row(
                children: <Widget>[
                  Text("修改",style: TextStyle(color: Colors.grey),),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PasswordChange();
              }));
            },
          ),
          Divider(thickness: 1,),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Flex(direction: Axis.horizontal,children: [
                Title(color: Colors.black, child: Text("注销账号", style: TextStyle(fontSize: 17),)),
                Expanded(child: Text("")),
                Row(
                  children: <Widget>[
                    Text("注销后账户无法恢复",style: TextStyle(color: Colors.grey),),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey[600],)
                  ],
                ),
              ],),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('警告',style: TextStyle(color: Colors.red),),
                    content: Text('确认注销账户？注销后账户无法恢复！'),
                    actions: <Widget>[
                      FlatButton(child: Text('取消'),onPressed: (){
                        Navigator.of(context).pop('cancel');
                      },),
                      FlatButton(child: Text('确认'),onPressed: (){
                        Navigator.of(context).pop('confirm');
                      },),
                    ],
                  );
                });
            },
          ),
          Divider(thickness: 1,),
        ],
      ),
    );
  }
}