import 'package:flutter/material.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/models/product.dart';
import 'package:xzn/services/product_service.dart';
import '../../page/product/product_show.dart';
class HomeProduct extends StatelessWidget {
  HomeProduct(this.width, this.product);

  double width;
  Product product;

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
                child: Image.network(
                  Config.baseUrl()+'picture/'+product.picture_list["shuffle"][0],
                  fit: BoxFit.fitWidth,
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
                          product.product_name,
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
                              text: product.price["num"].toString(),
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18
                              ),
                            ),
                            TextSpan(
                              text: "/"+product.price["unit"],
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
                            onPressed: () {
//                              Product product = await getProductDetails("", "");
                              Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductPage(product: product);
                                  }
                                )
                              );
                            },
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

class HomeProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeProductListState();
}

class _HomeProductListState extends State<HomeProductList> {

  var _future;

  @override
  void initState() {
    _future = getProductRecommendList("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        var widget;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            widget = Icon(
              Icons.error,
              color: Colors.red,
              size: 48,
            );
          } else {
            widget = Container(
              child: Wrap(
                spacing: 0.0,
                runSpacing: 4.0,
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                children: snapshot.data.map<Widget>(
                  (product) {
//                    print(product);
                    return HomeProduct(width, product);
                  }
                ).toList(),
              )
            );
          }
        } else {
          widget = Container(
            alignment: Alignment.center,
            child: Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(),
          ));
        }

        return widget;
      },
    );
  }
}