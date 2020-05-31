import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/order/order_detail.dart';

class OrderCard extends StatelessWidget {
  OrderCard({Key key,@required this.order,this.onTap: null}) : super(key: key);
  Function onTap;
  Order order;

  String truncateName(Order order) {
    String result = "";
    for (var product_item in order.product_list) {
      result += product_item["product"]["product_name"]+"*"+product_item["number"].toString()+"  ";
      if (result.length > 25) {
        result = result.substring(0, 25)+"···";
        break;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 30;
    Widget subbutton = this.order.order_status == "unpaid"?OutlineButton(
      highlightColor: Colors.blue[700],
      splashColor: Colors.grey,
      child: Text("去付款",style: TextStyle(color: Colors.grey[600], fontSize: 14),),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {},
    ):this.order.order_status == "unreceived"?OutlineButton(
      highlightColor: Colors.blue[700],
      splashColor: Colors.grey,
      child: Text("取认收货",style: TextStyle(color: Colors.grey[600], fontSize: 14),),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {},
    ):this.order.order_status == "uncomment"?OutlineButton(
      highlightColor: Colors.blue[700],
      splashColor: Colors.grey,
      child: Text("去评价",style: TextStyle(color: Colors.grey[600], fontSize: 14),),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {},
    ):Text("");
    return Container(
      height: 140,
      width: width,
//      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Text(truncateName(order)),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text("待付款"),
              ),
            ],
          ),
          Divider(thickness: 1,color: Colors.white,height: 5,),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Image.asset(
                  "assets/image/swiper/1.webp",
                  fit: BoxFit.cover,
                  width: 110,
                  height: 90,
                )
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 90,
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("下单时间：2020-04-26 16：30"),
                          Text("总价：￥33.33"),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 35,
                        alignment: Alignment.bottomRight,
                        child: ButtonBar(
                          buttonPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                          children: <Widget>[
                            subbutton,
                            OutlineButton(
                              highlightColor: Colors.blue[700],
                              splashColor: Colors.grey,
                              child: Text("查看订单",style: TextStyle(color: Colors.grey[600], fontSize: 14),),
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return OrderDetail(order: order);
                                    }
                                  )
                                );
                              },
                            ),
                            OutlineButton(
                              highlightColor: Colors.blue[700],
                              splashColor: Colors.grey,
                              child: Text("再来一份",style: TextStyle(color: Colors.grey[600], fontSize: 14),),
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {},
                            ),
                          ],
                        )
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
