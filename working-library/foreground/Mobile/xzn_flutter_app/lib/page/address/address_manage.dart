import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/models/address.dart';
import 'package:xzn/page/address/address_edit.dart';
import 'package:xzn/page/login/login_choose.dart';
import 'package:xzn/services/address_service.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/states/profile_change_notifier.dart';
import 'package:xzn/utils/platform_utils.dart';

class AddressCard extends StatelessWidget {
  AddressCard({Key key, @required this.address, this.update: null}) : super(key: key);
  Function update;
  Address address;
  String getSex(String sex) {
    switch (sex) {
      case "M":
        return "(先生)";
      case "F":
        return "(女士)";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    print(address.detail.toJson());
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Text(
                      // TODO: 修改地址信息
                      address.detail.city +
                      address.detail.district +
                      address.detail.township +
                      address.detail.street
//                      address.detail.no==null?"":address.detail.no
                    )),
                Expanded(
                    flex: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      color: Colors.lightBlue,
                      child: Text(
                        address.tag,
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    )),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () async {
                  bool change = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddressEdit(address:address);
                  }));
                  if (change??false) this.update();
                }),
            subtitle: Text(address.person["consignee"] +
                getSex(address.person["sex"]) +
                " " +
                address.phone.replaceRange(3, address.phone.length-2, "******")),
          ),
          Divider(
            height: 1,
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
        ],
      ),
    );
  }
}

class AddressManage extends StatefulWidget {
  @override
  _AddressManageState createState() => _AddressManageState();
}

class _AddressManageState extends State<AddressManage> {
  var _future;

  @override
  void initState() {
    _future = getAddressList(context);
    super.initState();
  }

  void edited() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收货地址"),
        centerTitle: true,
        actions: PlatformUtils.isWeb?null:<Widget>[
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Provider.of<UserModel>(context).isLogin?AddressEdit(
                    edit: false,
                  ):LoginChoose();
                }));
              },
              child: Text("新增地址", style: TextStyle(color: Colors.white)))
        ],
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          var widget;
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              widget = Icon(
                Icons.error,
                color: Colors.red,
                size: 48,
              );
            } else {
              print(snapshot.data);
              try {
                widget = ListView(
                  children: snapshot.data?.map<Widget>((address) {
                    return AddressCard(
                      address: address,
                      update: edited,
                    );
                  })?.toList(),
                );
              }catch(e) {
                widget = Image.asset("assets/image/no_login.webp");
              }
              if (snapshot.data?.length == 0) widget = Image.asset("assets/image/no_login.webp");
            }
          } else {
            widget = Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ));
          }
          return widget;
        },
      ),
    );
  }
}
