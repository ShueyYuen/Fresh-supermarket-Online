import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/address/address_edit.dart';

class AddressCard extends StatelessWidget {
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
                  child: Text("华东理工大学奉贤校区学生宿舍23号610")
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    color: Colors.lightBlue,
                    child: Text("学校",style: TextStyle(color: Colors.white, fontSize: 13),),
                  )
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            trailing: IconButton(icon: Icon(Icons.edit), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddressEdit();
              }));
            }),
            subtitle: Text("范(先生) 197******12"),
          ),
          Divider(height: 1, thickness: 2, indent: 15, endIndent: 15,),
        ],
      ),
    );
  }
}

class AddressManage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收货地址"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddressEdit(edit: false,);
            }));
          }, child: Text("新增地址",style: TextStyle(color: Colors.white)))
        ],
      ),
      body: ListView(
        children: <Widget>[
          AddressCard(),
          AddressCard(),
          AddressCard(),
          AddressCard(),
          AddressCard(),
        ],
      ),
    );
  }
}