import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';

class AddressLocated extends StatefulWidget {
  @override
  _AddressLocatedState createState() => _AddressLocatedState();
}

class _AddressLocatedState extends State<AddressLocated> {

  @override
  void initState() {
    print("开始定位");
    _checkPersmission();
    _startUP();
    print("well");
    super.initState();
  }

  _startUP() async {
    await AMapLocationClient.startup(
      AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters)
    );
  }

  void _checkPersmission() async{
    AMapLocationClient.startLocation();
  }

  void getLocation() async {
    print('获取定位');
    var locate = await AMapLocationClient.getLocation(true);
    print(locate);
    print("Cofalconer");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    getLocation();
    print("well");
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
    //注意这里关闭
    AMapLocationClient.shutdown();
    super.dispose();
  }
}