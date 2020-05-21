import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/cart.dart';
import 'package:xzn/services/product_service.dart';

class Classification extends StatefulWidget {
  @override
  _ClassificationState createState() => new _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  final List<String> _tabValues = [
    '鸡蛋',
    '鸭蛋',
    '坏蛋',
    '先知',
    '完蛋',
  ];
  TabController _controller;
  int _activeIndex = 0;
  bool click = false;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
    _controller.addListener(() {
      setState(() {
        _activeIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          centerTitle: true,
          title: Text('分类'),
          bottom: TabBar(
            tabs: _tabValues.map((f) {
              return Container(
                height: 80,
                width: 55,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Image.asset("assets/image/class/1.png"),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Stack(
                      children: <Widget>[
                        Transform.scale(
                          scale: 1.58,
                          child: Container(
                            color: Color.fromARGB(100, 255, 255, 255),
                            height: 18,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 4,
                          child: _tabValues[_controller.index] == f?Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text(f),
                          ):Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text(f),
                          )
                        )
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
            controller: _controller,
            indicatorColor: Colors.orangeAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.only(bottom: 100),
            indicator: null,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorWeight: 5.0,
            labelStyle: TextStyle(height: 1,),
          ),
        ),
        preferredSize: Size.fromHeight(150.0),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues.map((f) {
          return Center(
            child: GestureDetector(
              onTap: () {
                getProductRecommendList("");
                setState(() {
                  click = !click;
                });
              },
              child: AnimatedContainer(
                curve: Curves.bounceIn,
                height: click ? 200 : 100,
                width: click ? 200 : 100,
//                color: click?Colors.blue:Colors.red,
                duration: Duration(seconds: 1),
//                child: Text(f),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/swiper/3.webp'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(click ? 200 : 0,)
                  )),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
