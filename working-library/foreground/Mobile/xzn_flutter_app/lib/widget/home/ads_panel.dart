import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/services/ads_service.dart';

class AdsPanel extends StatefulWidget {
  @override
  _AdsPanelState createState() => _AdsPanelState();
}

class _AdsPanelState extends State<AdsPanel> {
  var _future;

  @override
  void initState() {
    _future = getAdsList("");
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
            print(snapshot.hasError);
            widget = Icon(
              Icons.error,
              color: Colors.red,
              size: 48,
            );
          } else {
              widget = ListView(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                shrinkWrap: true,
                children: <Widget>[
                  ...snapshot.data.map((cartItem) {
                    return ;
                  }),
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(flex: 3, child: Text("")),
                      Expanded(
                        flex: 2,
                        child: Divider(
                          thickness: 5,
                          color: Colors.green[100],
                        )),
                      Container(
                        alignment: Alignment.center,
                        child: Text("为您推荐"),
                      ),
                      Expanded(
                        flex: 2,
                        child: Divider(
                          thickness: 5,
                          color: Colors.green[100],
                        )),
                      Expanded(flex: 3, child: Text("")),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              );
          }
        } else {
          widget = Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 200,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            ));
        }
        return widget;
      },
    );
//      Column(
//      children: [
//        Container(
//          child: Flex(direction: Axis.horizontal, children: [
//            Expanded(
//              child: CachedNetworkImage(
//                imageUrl: Config.baseUrl() +
//                  "picture/" +
//                  order_item.product.picture_list["shuffle"][0],
//                fit: BoxFit.cover,
//                width: 80,
//                placeholder: (context, url) => placeholder,
//                errorWidget: (context, url, error) => placeholder,
//              ),
//            )
//          ],),
//        ),
//        Container(
//          child: Flex(direction: Axis.horizontal, children: [],),
//        ),
//      ],
//    );
  }
}