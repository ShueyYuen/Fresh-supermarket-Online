import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/address/address_select.dart';

class OrderConfirm extends StatefulWidget {
  @override
  _OrderConfirmState createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {

  bool protect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("确认订单"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 4,horizontal:20),
            color: Colors.amber[100],
            child: Row(
              children: <Widget>[
                Icon(Icons.volume_up),
                Text("为减少接触，降低奉献。请修改下方备注"),
              ],
            )
          ),
          ListTile(
            title: Text("华东理工大学奉贤校区学生宿舍楼23号"),
            trailing: Icon(Icons.arrow_forward_ios),
            subtitle: Text("范 197******26"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddressSelect();
              }));
            },
          ),
          Divider(
            height: 1,
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            title: Text("立即送出", style: TextStyle(fontSize: 14),),
            trailing: Text("约16：30送达",style: TextStyle(fontSize: 14, color: Colors.blue[400]),),
          ),
          Divider(
            height: 1,
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            title: Text("支付方式", style: TextStyle(fontSize: 14),),
            trailing: Text("微信支付",style: TextStyle(fontSize: 14, color: Colors.blue[400]),),
          ),
          Divider(
            color: Colors.grey[200],
            thickness: 15,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Wrap(
              runSpacing: 20,
              children: <Widget>[
                ListTile(
                  leading: Image.asset("assets/image/swiper/1.webp"),
                  title: Stack(
                    children: <Widget>[
                      Container(
                        child: Text("一只雷姆", style: TextStyle(fontSize: 16),),
                      ),
                      Positioned(
                        top: 5,
                        right: 20,
//                        alignment: Alignment.centerRight,
                        child: Text("x10", style: TextStyle(fontSize: 16),)
                      )
                    ],
                  ),
                  trailing: Text("￥19.63",style: TextStyle(fontSize: 14),),
                ),
                ListTile(
                  leading: Image.asset("assets/image/swiper/1.webp"),
                  title: Stack(
                    children: <Widget>[
                      Container(
                        child: Text("罗兹瓦尔·L·梅札斯", style: TextStyle(fontSize: 16),),
                      ),
                      Positioned(
                        top: 5,
                        right: 20,
//                        alignment: Alignment.centerRight,
                        child: Text("x100", style: TextStyle(fontSize: 16),)
                      )
                    ],
                  ),
                  trailing: Text("￥19.63",style: TextStyle(fontSize: 14),),
                ),
                ListTile(
                  leading: Image.asset("assets/image/swiper/1.webp"),
                  title: Stack(
                    children: <Widget>[
                      Container(
                        child: Text("一只拉姆", style: TextStyle(fontSize: 16),),
                      ),
                      Positioned(
                        top: 5,
                        right: 20,
//                        alignment: Alignment.centerRight,
                        child: Text("x10", style: TextStyle(fontSize: 16),)
                      )
                    ],
                  ),
                  trailing: Text("￥19.63",style: TextStyle(fontSize: 14),),
                ),
                ListTile(
                  leading: Padding(padding: EdgeInsets.symmetric(horizontal: 9),child: Container(
                    color: Colors.indigo[100],
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("配送费", style: TextStyle(color: Colors.indigo[900],fontSize: 14),),
                  ),),
                  title: Text("外卖员配送"),
                  trailing: Text("￥1000.0",style: TextStyle(fontSize: 14),),
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        children: <Widget>[
                          Text("金额说明",style: TextStyle(color: Colors.grey),),
                          Icon(Icons.help, color: Colors.grey,)
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      child: Text("小计  ￥33.33", style: TextStyle(
                        fontSize: 18
                      ),)
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[200],
            thickness: 15,
          ),
          ListTile(
            title: Text("订单备注", style: TextStyle(fontSize: 14),),
            trailing: Container(
              padding: EdgeInsets.only(top: 5),
              width: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("可选择无接触配送",style: TextStyle(fontSize: 14, color: Colors.grey),),
                  Icon(Icons.navigate_next,color: Colors.grey,)
                ],
              )
            )
          ),
          Divider(
            height: 1,
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            title: Text("号码保护", style: TextStyle(fontSize: 14),),
            subtitle: Text("不知道是啥，反正设计在这！！！"),
            trailing: Switch(value: protect, onChanged: (value) {
              setState(() {
                protect = value;
              });
            })
          ),
          Container(
            height: 100,
            color: Colors.grey[200],
            child: Text(""),
          )
        ],
      ),
      bottomSheet: Container(
        height: 50,
        child:Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerLeft,
                height: 100,
                color: Colors.grey[800],
                child: Text.rich(TextSpan(
                  style: TextStyle(
                    fontSize: 12, color: Colors.white),
                  children: [
                    TextSpan(
                      text: "￥33.33 ",
                      style: TextStyle(fontSize: 18)
                    ),
                    TextSpan(
                      text: "| 已优惠"+ "￥0.00",
                    ),
                  ])),
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 100,
                color: Color.fromARGB(255, 89, 209, 120),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("去支付", style: TextStyle(color: Colors.white,fontSize: 18),),
                  onPressed: () {},
                ),
              )
            )
          ],
        ),
      )
    );
  }
}