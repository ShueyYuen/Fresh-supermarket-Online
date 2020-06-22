import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PrivacyList extends StatefulWidget {
  @override
  _PrivacyListState createState() => _PrivacyListState();
}

class _PrivacyListState extends State<PrivacyList> {
  checkPermission() async {
    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }

// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
    ].request();
    print(statuses[Permission.location]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("使用如下权限"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("相机权限"),
          ),
          Divider(thickness: 1,),
          ListTile(
            title: Text("蓝牙权限"),
          ),
          Divider(thickness: 1,),
          ListTile(
            title: Text("位置权限"),
          ),
          Divider(thickness: 1,),
          ListTile(
            title: Text("Wifi信息权限"),
          ),
          Divider(thickness: 1,),
          ListTile(
            title: Text("网络权限"),
          ),
          Divider(thickness: 1,),
          ListTile(
            title: Text("存储权限"),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
              onPressed: () async {
                await checkPermission();
              },
              child: Text(
                "权限申请",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}