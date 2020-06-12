import 'package:flutter/material.dart';

class AddressLocated extends StatefulWidget {
  @override
  _AddressLocatedState createState() => _AddressLocatedState();
}

class _AddressLocatedState extends State<AddressLocated> {

  @override
  void initState() {
    print("开始定位");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择地址"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey,
            height: 400,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(onPressed: null, child: Text("data"))
                )
              ],
            ),
          ),
          ListTile(
            leading: Container(
              height: 40,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child:Text("●", style: TextStyle(fontSize: 10, color: Colors.grey[400]),),
            ),
            title: Text("华东理工大学奉贤校区信息大楼"),
            subtitle: Text("海思路999号华东理工大学奉贤校区信息大楼"),
          ),
          ListTile(
            leading: Container(
              height: 40,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child:Text("●", style: TextStyle(fontSize: 10, color: Colors.grey[400]),),
            ),
            title: Text("华东理工大学奉贤校区信息大楼"),
            subtitle: Text("海思路999号华东理工大学奉贤校区信息大楼"),
          ),
          ListTile(
            leading: Container(
              height: 40,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child:Text("●", style: TextStyle(fontSize: 10, color: Colors.orangeAccent),),
            ),
            title: Text("华东理工大学奉贤校区信息大楼", style: TextStyle(color: Colors.orangeAccent),),
            subtitle: Text("海思路999号华东理工大学奉贤校区信息大楼"),
          ),
          ListTile(
            leading: Container(
              height: 40,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child:Text("●", style: TextStyle(fontSize: 10, color: Colors.grey[400]),),
            ),
            title: Text("华东理工大学奉贤校区信息大楼"),
            subtitle: Text("海思路999号华东理工大学奉贤校区信息大楼"),
          ),
          ListTile(
            leading: Container(
              height: 40,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child:Text("●", style: TextStyle(fontSize: 10, color: Colors.grey[400]),),
            ),
            title: Text("华东理工大学奉贤校区信息大楼"),
            subtitle: Text("海思路999号华东理工大学奉贤校区信息大楼"),
          ),
          ListTile(
            leading: Container(
              height: 40,
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child:Text("●", style: TextStyle(fontSize: 10, color: Colors.grey[400]),),
            ),
            title: Text("华东理工大学奉贤校区信息大楼"),
            subtitle: Text("海思路999号华东理工大学奉贤校区信息大楼"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}