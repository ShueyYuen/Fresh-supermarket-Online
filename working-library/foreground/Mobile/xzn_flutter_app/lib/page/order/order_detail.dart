import 'package:flutter/material.dart';
import 'package:xzn/index.dart';

class OrderDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("订单已完成"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.headset_mic),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  child: Text("感谢您对鲜着呢的信任，期待再次光临",style: TextStyle(fontSize: 20),),
                ),
                OutlineButton(onPressed: () {},child: Text("电话联系"),)
              ],
            )
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              runSpacing: 10,
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
          Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
              runSpacing: 0,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("配送信息",style: TextStyle(fontSize: 20)),
                ),
                Divider(thickness: 1,height: 1,),
                ListTile(
                  title: Text("送达时间"),
                  trailing: Text("尽快送达",style: TextStyle(fontSize: 14),),
                ),
                Divider(thickness: 1,height: 1,),
                ListTile(
                  title: Text("收货地址"),
                  trailing: Text("华东理工大学奉贤校区学生公寓102号604\n范先生  182995461234",style: TextStyle(fontSize: 14),),
                ),
                Divider(thickness: 1,height: 1,),
                ListTile(
                  title: Text("配送方式"),
                  trailing: Text("外卖员配送",style: TextStyle(fontSize: 14),),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                runSpacing: 0,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("订单信息",style: TextStyle(fontSize: 20)),
                  ),
                  Divider(thickness: 1,height: 1,),
                  ListTile(
                    title: Text("订单号"),
                    trailing: Container(
                      width: 170,
                      child: Row(
                        children: <Widget>[
                          Text("12SFDF545DFSDF |",),
                          Container(
                            width: 30,
                            child: FlatButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {},
                              child: Text("复制",style: TextStyle(color: Colors.lightBlue),))
                          )
                        ],
                      )
                    )
                  ),
                  Divider(thickness: 1,height: 1,),
                  ListTile(
                    title: Text("支付方式"),
                    trailing: Text("微信支付",style: TextStyle(fontSize: 14),),
                  ),
                  Divider(thickness: 1,height: 1,),
                  ListTile(
                    title: Text("下单时间"),
                    trailing: Text("1314-05-20 11：55",style: TextStyle(fontSize: 14),),
                  ),
                  Divider(thickness: 1,height: 1,),
                  ListTile(
                    title: Text("订单备注"),
                    trailing: Text("cofalconer is idiot!",style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Stepper(
                      currentStep: 1,
                      controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}){
                        return Row(
                          children: <Widget>[],
                        );
                      },
                      steps: <Step>[
                        Step(
                          title: Text('订单提交成功'),
                          subtitle: Text("2020-05-20 12:04"),
                          content: SizedBox(height: 0,),
                          state: StepState.complete
                        ),
                        Step(
                          title: Text('订单已支付'),
                          subtitle: Text('2020-04-24 12：04'),
                          content: Text('2020-04-24 12：04')
                        ),
                        Step(
                          title: Text('订单已接单'),
                          subtitle: Text('2020-04-24 12：04'),
                          content: Text('今天是2020-4-25')
                        ),
                      ],
                    ),
//                    actions: <Widget>[
//                      FlatButton(child: Text('取消'),onPressed: (){
//                        Navigator.of(context).pop('cancel');
//                      },),
//                      FlatButton(child: Text('确认'),onPressed: (){
//                        Navigator.of(context).pop('confirm');
//                      },),
//                    ],
                  );
                }
              );
            },
          )
        ],
      )
    );
  }
}