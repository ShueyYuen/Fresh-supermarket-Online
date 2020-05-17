import 'package:flutter/material.dart';

class OperatorItem extends StatelessWidget {
  OperatorItem({Key key, this.icon, this.text: "", this.color}):super(key:key);
  IconData icon;
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
//        mainAxisSize: MainAxisSize.max
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 35,
            padding: EdgeInsets.only(left: 10),
            child:Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 35,
                  color: color,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600]
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Transform.scale(
              scale: 1.5,
              child:Icon(
                Icons.navigate_next,
                size: 35,
                color: Colors.grey[400],
              )
            ),
          ),
        ],
      ),
    );
  }
}

class OperatorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        OperatorItem(icon: Icons.info, text: "个人信息", color: Colors.blue[200],),
        Divider(color: Colors.black),
        OperatorItem(icon: Icons.location_on, text: "地址管理", color: Colors.green[200],),
        Divider(color: Colors.black),
        OperatorItem(icon: Icons.settings, text: "更多设置", color: Colors.red[200],),
        Divider(color: Colors.grey),
        OperatorItem(icon: Icons.headset_mic, text: "联系客服", color: Colors.blue[600],),
        Divider(color: Colors.black),
        OperatorItem(icon: Icons.share, text: "分享软件", color: Colors.brown[300],),
      ],
    );
  }
}