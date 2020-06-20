import 'package:flutter/material.dart';
import 'package:xzn/models/address.dart';
import 'package:xzn/page/address/address_edit.dart';
import 'package:xzn/services/address_service.dart';
import 'package:xzn/services/token.dart';

class AddressCard extends StatelessWidget {
  Address address;

  AddressCard({Key key, @required this.address}) : super(key: key);

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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(address);
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(address.detail.city +
                      address.detail.district +
                      address.detail.street)),
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
              subtitle: Text(address.person["consignee"]+getSex(address.person["sex"])+" "+address.phone.replaceRange(3, address.phone.length - 3, "******")),
            ),
            Divider(
              height: 1,
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class AddressSelect extends StatefulWidget {
  @override
  _AddressSelectState createState() => _AddressSelectState();
}

class _AddressSelectState extends State<AddressSelect> {
  var _future;

  @override
  void initState() {
    super.initState();
    _future = getAddressList(context, getToken(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择收货地址"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
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
              print(snapshot.hasError);
              widget = Icon(
                Icons.error,
                color: Colors.red,
                size: 48,
              );
            } else {
//              print(DemoLocalizations.of(context).title);
            print(snapshot.data);
              widget = ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "收货地址",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ...snapshot.data.map((address) {
                    return AddressCard(address: address);
                  }),
                  ListTile(
                    title: Text(
                      "新增地址",
                      style: TextStyle(color: Colors.blue),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue[300],
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddressEdit(
                          edit: false,
                        );
                      }));
                    },
                  )
                ],
              );
            }
          } else {
            widget = Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
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
