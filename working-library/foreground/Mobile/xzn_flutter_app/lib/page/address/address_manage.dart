import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/address/address_edit.dart';
import 'package:xzn/services/address_service.dart';

class AddressCard extends StatelessWidget {
  AddressCard({Key key, @required this.address}) : super(key: key);
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
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Text(address.detail["city"] +
                        address.detail["district"] +
                        "区" +
                        address.detail["street"] +
                        "路" +
                        address.detail["no"].toString() +
                        "号")),
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddressEdit(address:address);
                  }));
                }),
            subtitle: Text(address.person["consignee"] +
                getSex(address.person["sex"]) +
                " " +
                address.phone.replaceRange(3, 9, "******")),
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
    _future = getAddressList(context, "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收货地址"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddressEdit(
                    edit: false,
                  );
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
              widget = ListView(
                children: snapshot.data.map<Widget>((address) {
                  return AddressCard(
                    address: address,
                  );
                }).toList(),
              );
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
//      ListView(
//        children: <Widget>[
//          AddressCard(),
//          AddressCard(),
//          AddressCard(),
//          AddressCard(),
//          AddressCard(),
//        ],
//      ),
    );
  }
}
