import 'package:flutter/material.dart';
import 'package:xzn/app.dart';
import 'package:xzn/page/my/privacy_list.dart';
import 'package:xzn/page/my/privacy_policy.dart';

import '../order/confirm_order.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("隐私"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Title(color: Colors.black, child: Text("系统权限")),
            trailing: Container(
              alignment: Alignment.centerRight,
              width: 160,
              height: 20,
              child: Row(
                children: <Widget>[
                  Text("授权使用的手机权限",style: TextStyle(color: Colors.grey),),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PrivacyList();
              }));
            },
          ),
          Divider(thickness: 1,),
          ListTile(
            title: Title(color: Colors.black, child: Text("隐私政策")),
            trailing: Icon(Icons.arrow_forward_ios),
//            Container(
//              alignment: Alignment.centerRight,
//              width: 160,
//              height: 20,
//              child: Row(
//                children: <Widget>[
//                  Text("",style: TextStyle(color: Colors.grey),),
//                  Icon(Icons.arrow_forward_ios)
//                ],
//              ),
//            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PrivacyPolicy();
              }));
            },
          ),
          Divider(thickness: 1,),
        ],
      ),
    );
  }
}