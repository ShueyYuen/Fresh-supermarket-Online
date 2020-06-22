import 'package:flutter/material.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/widget/product/search_card.dart';

class CartRecommend extends StatefulWidget {
  @override
  _CartRecommendState createState() => _CartRecommendState();
}

class _CartRecommendState extends State<CartRecommend> {

  var _future;

  @override
  void initState() {
    _future = getProductRecommendList(getToken(context), quantity: 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            double width = MediaQuery.of(context).size.width;
            widget = Wrap(
              children: snapshot.data.map<Widget>((product) {
                return Container(
                  width: width/2 - 10,
                  height: 250,
                  child: SearchCard(
                    product: product,
                  )
                );
              }).toList(),
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
      }
    );
  }
}