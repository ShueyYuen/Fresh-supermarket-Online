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
            subtitle: Text("范(先生) 197******12"),
          ),
          Divider(height: 1, thickness: 2, indent: 15, endIndent: 15,),
        ],
      ),
    );
  }
}

class AddressSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择收货地址"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(onPressed: () {}, child: Text("新增地址",style: TextStyle(color: Colors.white)))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10),child: Text("收货地址", style: TextStyle(color: Colors.grey),),),
          AddressCard(),
          AddressCard(),
          AddressCard(),
          AddressCard(),
          ListTile(
            title: Text("新增地址", style: TextStyle(color: Colors.blue),),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[300],),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddressEdit(edit: false,);
              }));
            },
          )
        ],
      ),
    );
  }
}