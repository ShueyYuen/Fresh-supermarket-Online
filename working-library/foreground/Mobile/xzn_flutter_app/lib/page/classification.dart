import 'package:flutter/material.dart';
import 'package:xzn/page/search_page.dart';

class Classification extends StatefulWidget {
  @override
  _ClassificationState createState() => new _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  String section = "上海市奉贤区";

  final List<String> _tabValues = [
    '水果蔬菜',
    '肉禽蛋品',
    '水产海鲜',
    '米面粮油',
    '鲜奶乳品',
  ];
  final List<String> _tabValuesSecond = [
    '猪肉',
    '牛肉',
    '羊肉',
    '鸡肉',
    '嘿嘿嘿',
    '范先生',
  ];

  final List<String> secs = [
    '上海市奉贤区',
    '上海市黄浦区',
    '上海市徐汇区',
    '上海市长宁区',
    '上海市浦东新区',
    '上海市嘉定区',
    '上海市崇明区'
  ];

  TabController _controller;
  TabController _controllerSecond;
  int _activeIndex = 0;
  int _activeIndexSecond = 0;
  bool click = false;
  bool clickSecond = false;

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
    _controllerSecond = TabController(
      length: _tabValuesSecond.length,
      vsync: ScrollableState(),
    );
    _controllerSecond.addListener(() {
      setState(() {
        _activeIndexSecond = _controllerSecond.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          centerTitle: true,
          //title: Text('分类'),
          title: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on),
                    DropdownButton(
                      underline: Text(""),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                      ),
                      icon: Icon(Icons.expand_more),
                      iconSize: 24,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      value: section,
                      items: secs.map((value) {
                        return DropdownMenuItem(child: Text(value,), value: value);
                      }).toList(),
                      selectedItemBuilder: (context) {
                        return secs.map((value) {
                          return Container(alignment: Alignment.center,child: Text(value, style: TextStyle(color: Colors.white),),);
                        }).toList();
                      },
                      onChanged: (value) {
                        setState(() {
                          section = value;
                        });
                      },
                    )
                  ]
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:5),
                  width: 190,
                  child: FlatButton(
                    color: Colors.white,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.light,
                    splashColor: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.search),
                        Text("麻辣香锅", style: TextStyle(fontSize: 16))
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProductSearchPage();
                      }));
                    },
                  )),
              )
            ],
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Icon(Icons.location_on),
//              DropdownButton(
//                underline: Text(""),
//                style: TextStyle(
//                  color: Colors.black,
//                  fontSize: 20
//                ),
//                icon: Icon(Icons.expand_more),
//                iconSize: 24,
//                iconDisabledColor: Colors.white,
//                iconEnabledColor: Colors.white,
//                value: section,
//                items: secs.map((value) {
//                  return DropdownMenuItem(child: Text(value,), value: value);
//                }).toList(),
//                selectedItemBuilder: (context) {
//                  return secs.map((value) {
//                    return Container(alignment: Alignment.center,child: Text(value, style: TextStyle(color: Colors.white),),);
//                  }).toList();
//                },
//                onChanged: (value) {
//                  setState(() {
//                    section = value;
//                  });
//                },
//              ),
//              Container(
//                  padding: EdgeInsets.symmetric(horizontal:5),
//                  width: 190,
//                  child: FlatButton(
//                    color: Colors.white,
//                    highlightColor: Colors.blue[700],
//                    colorBrightness: Brightness.light,
//                    splashColor: Colors.grey,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Icon(Icons.search),
//                        Text("麻辣香锅", style: TextStyle(fontSize: 16))
//                      ],
//                    ),
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(20.0)),
//                    onPressed: () {
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) {
//                        return ProductSearchPage();
//                      }));
//                    },
//                  )),
//            ],
//          ),
          bottom: TabBar(
            tabs: _tabValues.map((f) {
              return Container(
                //height: 20,
                width: 80,
                child: Column(
                  children: <Widget>[
//                    Container(
//                        padding: EdgeInsets.all(3),
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(10.0)),
//                        child: Image.asset("assets/image/class/1.png")),
//                    SizedBox(
//                      height: 7,
//                    ),

                    Stack(
                      children: <Widget>[
//                        Transform.scale(
////                          scale: 1.58,
////                          child: Container(
////                            color: Color.fromARGB(100, 255, 255, 255),
////                            height: 18,
////                          ),
////                        ),
                        //Positioned(
                        Container(
                            //bottom: 0,
                            //left: 4,
                            height: 25,
                            //width: 100,
                            child: _tabValues[_controller.index] == f
                                ? Container(
                                    //padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Text(f),
                                  )
                                : Container(
                                    //padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                    alignment: Alignment.center,
                                    child: Text(f),
                                  ))
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
            labelStyle: TextStyle(
              height: 1,
            ),
          ),
        ),
        preferredSize: Size.fromHeight(90.0),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues.map((f) {
          return Column(
//            children: _tabValuesSecond.map((ff) {
//              return Row(
//                children: <Widget>[
//                  Container(
//                    height: 50,
//                    width: 100,
//                    decoration: BoxDecoration(
//                      color: Colors.orangeAccent,
//                    ),
//                    padding: EdgeInsets.symmetric(horizontal: 5),
//                    alignment: Alignment.center,
//                    child:
//                        Text(ff, style: TextStyle(fontWeight: FontWeight.bold)),
//                  ),
//                ],
//              );
//            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
