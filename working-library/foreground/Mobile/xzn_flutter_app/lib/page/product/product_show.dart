import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:share/share.dart';

class ProductLittleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image/product.jpg',
      fit: BoxFit.cover,
      height: 200,
    );
  }
}

class ProductPage extends StatelessWidget {
  List<String> swiper = <String>[
    'assets/image/swiper/1.webp',
    'assets/image/swiper/2.webp',
    'assets/image/swiper/3.webp',
    'assets/image/swiper/4.webp',
    'assets/image/swiper/5.webp'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width*900.0 / 1080.0;
    int badge = 5;
    double fontsize = badge > 100?8.0:badge>10?12:15;
    return Scaffold(
      appBar: PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0)),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                child: Swiper(
                  duration: 500,
                  itemCount: swiper.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Image.asset(
                        swiper[index],
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  autoplay: true,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 35.0,
                    maxWidth: 35.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: IconButton(
                      iconSize: 20,
                      color: Colors.white,
                      icon: Icon(Icons.navigate_before),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ),
                )
              ),
              Positioned(
                top: 10,
                right: 10,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 35.0,
                    maxWidth: 35.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: IconButton(
                      iconSize: 20,
                      color: Colors.white,
                      icon: Icon(Icons.share),
                      onPressed: () {
                        Share.share('张家界的真牛肉500g');
                      },
                    )
                  ),
                )
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  height: 40,
                  color: Colors.blue[100],
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "鲜着呢~正品保障~绝对新鲜~配送全市~售后无忧",
                    style: TextStyle(
                      color: Colors.redAccent
                    ),
                  )
                )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 20, 10, 5),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "张家界的真牛肉500g",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                Text(
                  "产于奉献某养牛场",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      width: 1000,
                      padding: EdgeInsets.only(top: 15),
                      child: Text.rich(TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.redAccent[200]
                        ),
                        children: [
                          TextSpan(
                            text: "￥",
                          ),
                          TextSpan(
                            text: "80.0",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.redAccent[200]
                            ),
                          ),
                          TextSpan(
                            text: "/斤"+"   ",
                            style: TextStyle(
                              color: Colors.grey[600]
                            )
                          ),
                          TextSpan(
                            text: "￥90.0  ",
                            style: TextStyle(
                              color: Colors.grey[500],
                              decoration: TextDecoration.lineThrough
                            ),
                          ),
                        ]
                      )),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Text("月销售666件",style: TextStyle(color: Colors.grey),),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 20, thickness: 10,),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 50.0,
                  child: Text("配送"),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 50.0,
                  child: Text("包邮，全程冷链运输，1.5小时内送达，因交通情况派送或许有延迟"),
                ),
              ),
            ],
          ),
          Divider(height: 20, thickness: 10,),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 50.0,
                  child: Text("促销"),
                ),
              ),
              Expanded(
                flex: 1,
                child: Chip(
                  backgroundColor: Colors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.orange,
                  ),
                  label: new Text('8.8折'),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 50.0,
                  child: Text("国庆期间专项产品，没人每天购买不超过一件，享受此优惠"),
                ),
              ),
            ],
          ),
          Divider(height: 20, thickness: 10,),
          // 推荐商品
          Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("推荐商品",style: TextStyle(fontSize: 16),),
                Container(
                  width: width,
                  height: 210,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //横轴三个子widget
                      childAspectRatio: 0.62 //宽高比为1时，子widget
                    ),
                    children:<Widget>[
                      ProductLittleCard(),
                      ProductLittleCard(),
                      ProductLittleCard(),
                    ]
                  )
                ),
              ],
            ),
          ),
          Divider(height: 20, thickness: 10,),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("商品详情",style: TextStyle(fontSize: 16),),
                ),
                Table(
                  columnWidths: const {
                    0: FixedColumnWidth(100.0),
                  },
                  border: TableBorder.all(
                    color: Colors.grey[200],
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  children: [
                    TableRow(
                      children: [
                        Padding(padding: EdgeInsets.all(5),child: Text('产地',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),),
                        Padding(padding: EdgeInsets.all(5),child: Text('中国',textAlign: TextAlign.left),),
                      ]
                    ),
                    TableRow(
                      children: [
                        Padding(padding: EdgeInsets.all(5),child: Text('重量',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),),
                        Padding(padding: EdgeInsets.all(5),child: Text('0.5Kg',textAlign: TextAlign.left),),
                      ]
                    ),
                    TableRow(
                      children: [
                        Padding(padding: EdgeInsets.all(5),child: Text('保存方式',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),),
                        Padding(padding: EdgeInsets.all(5),child: Text('冷藏',textAlign: TextAlign.left),),
                      ]
                    ),
                  ],
                ),
                Image.asset(
                  'assets/image/swiper/1.webp',
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/image/swiper/2.webp',
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/image/swiper/3.webp',
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/image/swiper/4.webp',
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/image/swiper/5.webp',
                  width: width,
                  fit: BoxFit.fitWidth,
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 55,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                height: 55,
                alignment: Alignment.topCenter,
                child: FlatButton(
                  onPressed: () {
                    print("跳转购物车");
                  },
                  child: Stack(
                    alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.topCenter,
                        child: Icon(Icons.shopping_cart,size: 40,color: Colors.grey,),
                      ),
                      Positioned(
                        top: 10,
                        right: 20,
                        child: badge>0?Container(
                          width: 16,
                          height: 16,
                          child: Center(
                            child: Text(
                              badge.toString(),
                              style: TextStyle(
                                fontSize: fontsize,
                                color: Colors.white
                              )
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: new BorderRadius.all(
                              const Radius.circular(16.0),
                            ),
                          ),
                        ):Text("")
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
//                  color: Color.fromARGB(1, 138, 226, 255),
                  color: Color.fromARGB(255, 194, 224, 237),
                  textColor: Color.fromARGB(255, 56, 184, 240),
                  onPressed: () {},
                  child: Text("加入购物车",style: TextStyle(fontSize: 16),)
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 28),
                  color: Color.fromARGB(255, 44, 160, 253),
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text("立即购买",style: TextStyle(fontSize: 16),)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}