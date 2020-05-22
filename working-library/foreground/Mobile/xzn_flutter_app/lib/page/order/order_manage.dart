import 'package:flutter/material.dart';
import 'package:xzn/index.dart';
import 'package:xzn/page/cart.dart';
import 'package:xzn/services/product_service.dart';
import 'package:xzn/widget/order/OrderCard.dart';

class OrderManage extends StatefulWidget {
  OrderManage({Key key, this.activeIndex: 0}):super(key:key);

  int activeIndex;

  @override
  _OrderManageState createState() => new _OrderManageState();
}

class _OrderManageState extends State<OrderManage> {
  final List<String> _tabValues = [
    '全部',
    '待付款',
    '待收货',
    '待评价',
    '已完成',
  ];
  TabController _controller;
  int _activeIndex;
  bool click = false;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
    _activeIndex = widget.activeIndex;
    _controller.index = _activeIndex;
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
          title: Text('我的订单'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child:Material(
              color: Colors.white,
              child:TabBar(
                tabs: _tabValues.map((f) {
                  return Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: Text(f),
                  );
                }).toList(),
                controller: _controller,
                indicatorColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                indicatorWeight: 5.0,
              ),
            ),
          )
        ),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues.map((f) {
          return Wrap(
            children: <Widget>[
              OrderCard()
            ],
          );
        }).toList(),
      ),
    );
  }
}
