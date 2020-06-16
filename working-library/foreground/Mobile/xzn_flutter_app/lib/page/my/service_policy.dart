import 'package:flutter/material.dart';

import '../order/confirm_order.dart';

class ServicePolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("鲜着呢用户服务协议"),
        centerTitle: true,
      ),
      body: ListView(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Title(color: Colors.black, child: Text("鲜着呢用户服务协议", style: TextStyle(fontSize: 35),)),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 10),
            child: Text("生效日期：1314年5月20日"),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("这是一堆很好看和方便实施剥削的屁话，我们对这个做任何更改你都不会知道，因为你就是砧板上的渣渣。反正用户不会看我就随便写写糊弄啦。"),
          )
        ],
      ),
    );
  }
}