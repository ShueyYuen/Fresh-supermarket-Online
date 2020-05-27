import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xzn/index.dart';

class SearchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(15)
      ),
      clipBehavior: Clip.antiAlias,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Image.asset(
                "assets/image/swiper/3.webp",
                fit: BoxFit.fitWidth,
                width: double.infinity,
              )
            )
          ),
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
                      Text("现摘草莓 大草莓 500g"),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Text("24小时发货"),
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
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: IconButton(
                      iconSize: 20,
                      color: Colors.white,
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
//                              Product product = await getProductDetails("", "");
//                        Navigator.push(context,
//                          MaterialPageRoute(
//                            builder: (context) {
////                              return ProductPage(product: product);
//                            }
//                          )
//                        );
                      },
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductSearchPage extends StatelessWidget {

  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  _displaySnackBar(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: PreferredSize(
        child:AppBar(
          elevation: 0,
          title: Container(
            height: 32,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            )
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductSearchPage();
                  }
                )
              );
            })
          ],
          bottom: PreferredSize(
            child:Builder(
              builder: (context) => Container(
                height: 30,
                width: double.infinity,
                color: Colors.white,
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("价格"),
                      )
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("销量"),
                      )
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: FlatButton.icon(
                          icon: Icon(Icons.youtube_searched_for),
                          label: Text("筛选"),
                          onPressed: () {
                            _displaySnackBar(context);
                          },
                        ),
                      )
                    )
                  ],
                ),
              ),
            )
          ),
        ),
        preferredSize: Size.fromHeight(80.0),
      ),
      endDrawer: Drawer(
        semanticLabel: "Cofalconer",
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Image.asset("assets/image/swiper/1.webp", fit: BoxFit.fitWidth,)),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              color: Colors.grey[200],
              height: 50,
              child: Text("筛选"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("价格区间"),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 90,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        )
                      ),
                      Icon(Icons.more_horiz),
                      Container(
                        height: 30,
                        width: 90,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("价格区间"),
                  Wrap(
                    spacing: 10,
                    children: <Widget>[
                      ChoiceChip(label: Text("水果蔬菜"), selected: true),
                      ChoiceChip(label: Text("水产海鲜"), selected: false),
                      ChoiceChip(label: Text("肉食蛋白"), selected: false),
                      ChoiceChip(label: Text("玉米粮油"), selected: false),
                      ChoiceChip(label: Text("鲜奶乳品"), selected: false),
                    ],
                  )
                ],
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(onPressed: () {}, child: Text("重置")),
                FlatButton(onPressed: () {}, child: Text("确定"))
              ],
            )
          ],
        ),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //横轴三个子widget
          childAspectRatio: 1.0 / 1.3 //宽高比为1时，子widget
        ),
        children:<Widget>[
          SearchCard(),
          SearchCard(),
          SearchCard(),
          SearchCard(),
          SearchCard(),
          SearchCard(),
          SearchCard(),
          SearchCard(),
          SearchCard(),
          SearchCard(),
        ]
      )
    );
  }
}