import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:xzn/page/address/address_manage.dart';

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
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          this.onTap();
        },
      ),
    );
  }
}

class OperatorList extends StatelessWidget {
  void contact_customer() {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OperatorItem(icon: Icons.info, text: "个人信息", color: Colors.blue[200],
          onTap: () {

          },
        ),
        OperatorItem(icon: Icons.location_on, text: "地址管理", color: Colors.green[200],onTap: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) {
                return AddressManage();
              }
            )
          );
        }),
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
        OperatorItem(icon: Icons.share, text: "关于软件", color: Colors.brown[300],onTap: () {
          showAboutDialog(
            context: context,
            applicationIcon: Image.asset(
              'assets/image/login_logo.webp',
              height: 100,
              width: 100,
            ),
            applicationName: '鲜着呢',
            applicationVersion: 'v1.0.0',
            applicationLegalese: '© 鲜着呢开发团体',
            children: <Widget>[
              Text("闲着蛋疼开发这个玩意儿干嘛!!!"),
            ],
          );
//          Share.share('https://xzn.cofal.top');
        }),
      ],
    );
  }
}