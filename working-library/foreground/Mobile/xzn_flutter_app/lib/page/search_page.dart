import 'package:flutter/material.dart';

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
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              color: Colors.grey[200],
              height: 50,
              child: Text("筛选"),
            ),
          ],
        ),
      ),
      body: Wrap(
        children: <Widget>[

        ],
      )
    );
  }
}