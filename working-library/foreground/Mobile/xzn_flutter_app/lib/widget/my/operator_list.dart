import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/page/address/address_manage.dart';
import 'package:xzn/page/login/login_choose.dart';
import 'package:xzn/page/my/customer_service.dart';
import 'package:xzn/page/my/information.dart';
import 'package:xzn/states/profile_change_notifier.dart';
import 'package:xzn/utils/platform_utils.dart';

import '../../page/my/setting.dart';

class OperatorItem extends StatelessWidget {
  OperatorItem({Key key, this.icon, this.text: "", this.color, this.onTap})
      : super(key: key);
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
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OperatorItem(
          icon: Icons.info,
          text: "个人信息",
          color: Colors.blue[200],
          onTap: () {
            if (Provider.of<UserModel>(context).isLogin)
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Information();
            }));
            else Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginChoose();
            }));
          },
        ),
        OperatorItem(
            icon: Icons.location_on,
            text: "地址管理",
            color: Colors.green[200],
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddressManage();
              }));
            }),
        OperatorItem(
            icon: Icons.settings,
            text: "更多设置",
            color: Colors.red[200],
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingPage();
              }));
            }),
        PlatformUtils.isWeb?SizedBox(height: 0,):OperatorItem(
            icon: Icons.headset_mic,
            text: "联系客服",
            color: Colors.blue[600],
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CustomerService();
              }));
            }),
        OperatorItem(
            icon: Icons.share,
            text: "关于软件",
            color: Colors.brown[300],
            onTap: () {
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
