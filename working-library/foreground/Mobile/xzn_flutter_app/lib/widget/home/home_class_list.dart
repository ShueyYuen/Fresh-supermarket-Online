import 'package:flutter/material.dart';

class ClassCardWidget extends StatelessWidget {
  double width;
  String image;
  String description;

  ClassCardWidget(this.image, this.description, this.width);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Image.asset(
          image,
          width: width,
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 12
          ),
        )
      ],
    );
  }
}

class HomeClassMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 5.5;
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.yellow[200],
      padding: EdgeInsets.only(bottom: 10.0),
      child: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center, //沿主轴方向居中
        children: <Widget>[
          ClassCardWidget("assets/image/class/1.png","水果蔬菜",width),
          ClassCardWidget("assets/image/class/2.png","肉禽蛋品",width),
          ClassCardWidget("assets/image/class/3.png","水产海鲜",width),
          ClassCardWidget("assets/image/class/4.png","米面粮油",width),
          ClassCardWidget("assets/image/class/5.png","鲜奶乳品",width),
        ],
      ),
    );
  }
}

class HomeClassSub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 5.5;
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center, //沿主轴方向居中
        children: <Widget>[
          ClassCardWidget("assets/image/class/1-1.png","番茄",width),
          ClassCardWidget("assets/image/class/1-2.png","柠檬",width),
          ClassCardWidget("assets/image/class/1-3.png","黄瓜",width),
          ClassCardWidget("assets/image/class/1-4.png","豆制品",width),
          ClassCardWidget("assets/image/class/1-5.png","菌菇",width),
          ClassCardWidget("assets/image/class/1-6.png","猪肉",width),
          ClassCardWidget("assets/image/class/1-7.png","鸡",width),
          ClassCardWidget("assets/image/class/1-8.png","鱼类",width),
          ClassCardWidget("assets/image/class/1-9.png","蛋蛋",width),
          ClassCardWidget("assets/image/class/1-10.png","全部分类",width),
        ],
      ),
    );;
  }
}

class HomeClassList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HomeClassMain(),
        HomeClassSub()
      ],
    );
  }
}