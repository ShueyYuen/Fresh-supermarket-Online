import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xzn/models/cartItem.dart';
import 'package:xzn/models/product.dart';
import 'package:xzn/page/login/login_choose.dart';
import 'package:xzn/page/product/product_show.dart';
import 'package:xzn/services/cart_service.dart';
import 'package:xzn/services/picture.dart';
import 'package:xzn/states/profile_change_notifier.dart';
class SearchCard extends StatelessWidget {
  SearchCard({Key key, this.product, this.onUpdate}) : super(key: key);

  Product product;
  Function onUpdate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductPage(product: product);
        }));
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: PictureSelf(product.picture_list["shuffle"][0],
                  product: product, boxFit: BoxFit.cover))),
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(product.product_name, maxLines: 1,),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Text("半小时发货"),
                          ],
                        ),
//                      Text.rich(textSpan)
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                        BorderRadius.all(Radius.circular(30))),
                      child: IconButton(
                        iconSize: 20,
                        color: Colors.white,
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () async {
                          bool result = await updateCart(context, CartItem.fromJson({
                            "product": product.toJson(),
                            "number": 1
                          }));
                          if (result)
                            if (this.onUpdate != null) this.onUpdate();
                          var snackBar = SnackBar(
                            duration: Duration(seconds: 1),
                            content: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                Text(product.product_name + '已经在购物车躺好等您咯！')
                              ],
                            ),
                            behavior: SnackBarBehavior.floating,
                          );
                          if (Provider.of<UserModel>(context).isLogin)
                            Scaffold.of(context).showSnackBar(snackBar);
                          else Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return LoginChoose();
                          }));
                        },
                      )),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      "￥" + (product.price["num"]*product.discount).toStringAsFixed(2),
                      style: TextStyle(fontSize: 18, color: Colors.redAccent),
                    ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}