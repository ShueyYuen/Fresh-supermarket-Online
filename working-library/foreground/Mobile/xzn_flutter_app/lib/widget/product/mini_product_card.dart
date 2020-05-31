import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/models/product.dart';
import 'package:xzn/page/product/product_show.dart';
import 'package:xzn/widget/common/flat_icon_button.dart';

class MiniProductCard extends StatelessWidget {
  MiniProductCard({Key key, @required this.product}):super(key:key);

  Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              offset: Offset(0, 0),
              blurRadius: 10.0,
              spreadRadius: 1.0),
          ],
          borderRadius: BorderRadius.circular(15)),
        child: Container(
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    imageUrl: Config.baseUrl() +
                      "picture/"+product.picture_list["shuffle"][0],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset(
                      "assets/image/default_picture.webp",
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/image/default_picture.webp",
                    ),
                  )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: Text(
                          product.product_name+" 经过安全检验 放心购买",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: FlatIconButton(
                          icon: Icons.add,
                          size: 25,
                        )),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          "￥"+product.price["num"].toString(),
                          style: TextStyle(color: Colors.red),
                        ))
                    ],
                  )))
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return ProductPage(product: product);
          }));
      },
    );
  }
}
