import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/address/address_manage.dart';
import 'package:xzn/page/address/address_located.dart';

class AddressEdit extends StatelessWidget {
  AddressEdit({Key key, this.edit: true});
  bool edit;
  Address addres;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.edit?"修改地址":"新增收货地址"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever,color: Colors.white,),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.topLeft,
                    child: Text("联系人",style: TextStyle(fontSize: 18),),
                  )
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 10,
                        children: <Widget>[
                          Chip(label: Text("先生")),
                          Chip(label: Text("女士")),
                          Chip(label: Text("null")),
                        ],
                      )
                    ],
                  )
                ),
              ],
            )
          ),
          Divider(height: 1, thickness: 1,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    alignment: Alignment.topLeft,
                    child: Text("电话",style: TextStyle(fontSize: 18),),
                  )
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ),
              ],
            )
          ),
          Divider(height: 1, thickness: 1,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    alignment: Alignment.topLeft,
                    child: Text("地址",style: TextStyle(fontSize: 18),),
                  )
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 30,
                    maxWidth: 30
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.grey,), onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return AddressLocated();
                      }));
                  }),
                ),
//                Transform.translate(offset: Offset(-10, -10),child: ConstrainedBox(
//                  constraints: BoxConstraints(
//                    maxWidth: 40,
//                    maxHeight: 30
//                  ),
//                  child: IconButton(
//                    icon: Icon(Icons.navigate_next,size: 40,color: Colors.grey,),
//                    onPressed: () {
//
//                    }
//                  )
//                ),)
              ],
            )
          ),
          Divider(height: 1, thickness: 1,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    alignment: Alignment.topLeft,
                    child: Text("门牌号",style: TextStyle(fontSize: 18),),
                  )
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ),
              ],
            )
          ),
          Divider(height: 1, thickness: 1,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    alignment: Alignment.topLeft,
                    child: Text("标签",style: TextStyle(fontSize: 18),),
                  )
                ),
                Expanded(
                  flex: 4,
                  child: Wrap(
                    spacing: 10,
                    children: <Widget>[
                      Chip(label: Text("   家   ")),
                      Chip(label: Text("学校")),
                      Chip(label: Text("公司"))
                    ],
                  )
                ),
              ],
            )
          ),
          Divider(height: 1, thickness: 1,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("保存",style: TextStyle(fontSize: 18),),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      )
    );
  }
}