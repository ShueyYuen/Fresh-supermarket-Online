import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/states/profile_change_notifier.dart';
import 'package:xzn/widget/product/mini_product_card.dart';

class ProductRecommendGrid extends StatefulWidget {
  @override
  _ProductRecommendGridState createState() => _ProductRecommendGridState();
}

class _ProductRecommendGridState extends State<ProductRecommendGrid> {

  var _future;

  @override
  void initState() {
    String token = Provider.of<UserModel>(context, listen: false).user.token;
    _future = getProductRecommendList(token,quantity: 6);
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
              width: width,
              height: 210,
              child: GridView(
                scrollDirection: Axis.horizontal,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, //横轴三个子widget
                  childAspectRatio: 1.65 //宽高比为1时，子widget
                ),
                children: snapshot.data.map<Widget>((product) {
                  return MiniProductCard(product: product);
                }).toList(),));
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
      }
    );
  }
}