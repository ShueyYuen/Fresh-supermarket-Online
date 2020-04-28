import 'package:flutter/material.dart';

class HomeProduct extends StatelessWidget {
  double width;
  HomeProduct(this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child:  Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 70.0,
                child: Image.asset(
                  'assets/image/swiper/3.webp',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.only(left: 15.0),
                padding: EdgeInsets.symmetric(vertical: 15),
                height: 110.0,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Colors.grey[300]
                    ),
                  )
                ),
                child: Stack(
                  children: <Widget>[
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 7.0, // 主轴(水平)方向间距
                      runSpacing: 4.0, // 纵轴（垂直）方向间距
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Text(
                          "婚纱雷姆",
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            '热卖',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12
                            ),
                          ),
                        ),
                        Text.rich(TextSpan(
                          children: [
                            TextSpan(
                              text: "￥",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 12
                              )
                            ),
                            TextSpan(
                              text: "0.01",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18
                              ),
                            ),
                            TextSpan(
                              text: "/位",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13
                              ),
                            ),
                          ]
                        ))
                      ],
                    ),
                    Positioned(
                      right: 10.0,
                      bottom: 0.0,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 35.0,
                          maxWidth: 35.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: IconButton(
                            iconSize: 20,
                            color: Colors.white,
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {},
                          )
                        ),
                      )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Wrap(
      spacing: 0.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.center, //沿主轴方向居中
      direction: Axis.vertical,
      children: <Widget>[
        HomeProduct(width),
        HomeProduct(width),
        HomeProduct(width),
        HomeProduct(width),
        HomeProduct(width),
        HomeProduct(width),
        HomeProduct(width),
        HomeProduct(width),
        HomeProduct(width),
        HomeProduct(width),
        HomeProduct(width),
      ],
    );
  }
}