import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/models/product.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/states/profile_change_notifier.dart';
import 'package:xzn/widget/common/flat_icon_button.dart';
import '../../page/product/product_show.dart';

class HomeProduct extends StatelessWidget {
  HomeProduct(this.width, this.product);

  double width;
  Product product;
  Widget placeholder = Image.asset(
    "assets/image/default_picture.webp", //头像占位图，加载过程中显示
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return ProductPage(product: product);
          }));
      },
      child: Container(
        width: width,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 70.0,
                  child: CachedNetworkImage(
                    imageUrl: Config.baseUrl() +
                      'picture/' +
                      product.picture_list["shuffle"][0],
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) => placeholder,
                    errorWidget: (context, url, error) => placeholder,
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
                      bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
                    )),
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
                            style: TextStyle(fontSize: 15),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 3),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.redAccent),
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Text(
                              '热卖',
                              style: TextStyle(
                                color: Colors.redAccent, fontSize: 12),
                            ),
                          ),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "￥",
                              style: TextStyle(
                                color: Colors.redAccent, fontSize: 12)),
                            TextSpan(
                              text: product.price["num"].toString(),
                              style: TextStyle(
                                color: Colors.redAccent, fontSize: 18),
                            ),
                            TextSpan(
                              text: "/" + product.price["unit"],
                              style:
                              TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ]))
                        ],
                      ),
                      Positioned(
                        right: 10.0,
                        bottom: 0.0,
                        child: FlatIconButton(
                          icon: Icons.shopping_cart,
                          size: 30,
                          onTap: () {
                            if (!Provider.of<CartModel>(context).isExist(product))
                              Provider.of<CartModel>(context).add(product, 1);
                            var snackBar = SnackBar(
                              duration: Duration(seconds: 1),
                              content: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    product.product_name + '已经在购物车躺好等您咯！')
                                ],
                              ),
                              behavior: SnackBarBehavior.floating,
                            );
                            Scaffold.of(context).showSnackBar(snackBar);
                          },
                        ),
                      ),
                    ],
                  )),
              ),
            ],
          ),
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
              children: snapshot.data.map<Widget>((product) {
                return HomeProduct(width, product);
              }).toList(),
            ));
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
