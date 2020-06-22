import 'package:flutter/material.dart';
import 'package:xzn/app.dart';
import 'package:xzn/page/classification.dart';

class ClassCardWidget extends StatelessWidget {
  double width;
  String image;
  String description;
  int idx;
  Function changePage;

  ClassCardWidget(this.image, this.description, this.width, this.idx, {this.changePage});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          changePage(1, idx);
//          Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return Classification(idx: 0,);
//          }));
        },
        child: new Column(
//      alignment: Alignment.bottomCenter,
          children: <Widget>[
            Image.asset(
              image,
              width: width,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ));
  }
}

class HomeClassMain extends StatelessWidget {
  HomeClassMain({this.changePage});
  Function changePage;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 5.5;
    return Container(
      width: MediaQuery.of(context).size.width,
//      color: Colors.yellow[200],
      padding: EdgeInsets.only(bottom: 10.0),
      child: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center, //沿主轴方向居中
        children: <Widget>[
          ClassCardWidget("assets/image/class/1.png", "水果蔬菜", width, 0, changePage: changePage,),
          ClassCardWidget("assets/image/class/2.png", "肉禽蛋品", width, 1, changePage: changePage,),
          ClassCardWidget("assets/image/class/3.png", "水产海鲜", width, 2, changePage: changePage,),
          ClassCardWidget("assets/image/class/4.png", "米面粮油", width, 3, changePage: changePage,),
          ClassCardWidget("assets/image/class/5.png", "鲜奶乳品", width, 4, changePage: changePage,),
        ],
      ),
    );
  }
}
