import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/models/ads.dart';
import 'package:xzn/models/product.dart';
import 'package:xzn/page/product/product_show.dart';
import 'package:xzn/page/web_view.dart';
import 'package:xzn/services/ads_service.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/states/profile_change_notifier.dart';

class AdsCard extends StatelessWidget {
  AdsCard({this.ads, this.mini: false});
  bool mini;
  Ads ads;
  Product _product;
  String token;

  @override
  Widget build(BuildContext context) {
    Widget placeholder = Image.asset(
      "assets/image/default_picture.webp", //头像占位图，加载过程中显示
      height: mini ? 60 : 80,
      fit: BoxFit.cover,
    );
    String imageUrl = Config.baseUrl() + "user/adpic/" + ads.picture;
    return Expanded(
        child: GestureDetector(
      child: CachedNetworkImage(
        height: mini ? 60 : 80,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => placeholder,
        errorWidget: (context, url, error) => placeholder,
      ),
      onTap: () async {
        if (ads.type == "url") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WebView(url: ads.data);
          }));
        } else {
          _product =
              await getProductDetails(getToken(context), ads.data.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductPage(product: _product);
          }));
        }
      },
    )
//      Image.network(Config.baseUrl()+"user/adpic/"+ads.picture)
        );
  }
}

class AdsPanel extends StatefulWidget {
  @override
  _AdsPanelState createState() => _AdsPanelState();
}

class _AdsPanelState extends State<AdsPanel> {
  var _future;

  @override
  void initState() {
    _future = getAdsList(context);
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
            widget = Column(
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    AdsCard(
                      ads: snapshot.data[0],
                    ),
                    AdsCard(
                      ads: snapshot.data[1],
                    )
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    AdsCard(
                      ads: snapshot.data[2],
                      mini: true,
                    ),
                    AdsCard(
                      ads: snapshot.data[3],
                      mini: true,
                    ),
                    AdsCard(
                      ads: snapshot.data[4],
                      mini: true,
                    )
                  ],
                ),
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
  }
}
