import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../page/my/setting.dart';

class OperatorItem extends StatelessWidget {
  OperatorItem({Key key, this.icon, this.text: "", this.color, this.onTap}):super(key:key);
  IconData icon;
  String text;
  Color color;
  var onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: ListTile(
        leading: Icon(
          icon,
          size: 35,
          color: color,
        ),
        title: Title(
          color: Colors.grey[600],
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600]
            ),
          ),
        ),
        trailing: Transform.scale(
          scale: 1.5,
          child:Icon(
            Icons.navigate_next,
            size: 35,
            color: Colors.grey[400],
          )
        ),
        onTap: () {
          this.onTap();
        },
      ),
    );
  }
}

class OperatorList extends StatelessWidget {
  void address_manager() {

  }

  void contact_customer() {

  }

  void share_app() {
    Share.share('https://xzn.cofal.top');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OperatorItem(icon: Icons.info, text: "个人信息", color: Colors.blue[200],
          onTap: () {

          },
        ),
        OperatorItem(icon: Icons.location_on, text: "地址管理", color: Colors.green[200],onTap: address_manager),
        OperatorItem(icon: Icons.settings, text: "更多设置", color: Colors.red[200],
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) {
                  return SettingPage();
                }
              )
            );
          }),
        OperatorItem(icon: Icons.headset_mic, text: "联系客服", color: Colors.blue[600],onTap: contact_customer),
        OperatorItem(icon: Icons.share, text: "分享软件", color: Colors.brown[300],onTap: share_app),
      ],
    );
  }
}