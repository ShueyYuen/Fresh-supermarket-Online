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
          FlatButton(
            onPressed: () async {
              await checkPermission();
            },
            child: Text("权限"),
          )
        ],
      ),
    );
  }
}