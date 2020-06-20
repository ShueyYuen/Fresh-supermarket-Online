import 'package:flutter/material.dart';
import 'package:xzn/services/order_service.dart';
import 'package:xzn/services/token.dart';
import 'package:xzn/widget/order/order_card.dart';

class OrderManage extends StatefulWidget {
  OrderManage({Key key, this.activeIndex: 0}) : super(key: key);

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
  var _future;

  @override
  void initState() {
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
    _future = getOrderList(context, getToken(context));
    super.initState();
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
              child: Material(
                color: Colors.white,
                child: TabBar(
                  tabs: _tabValues.map((f) {
                    return Container(
                      width: 50,
                      alignment: Alignment.center,
                      child: Text(f),
                    );
                  }).toList(),
                  controller: _controller,
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 5.0,
                ),
              ),
            )),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues.map((f) {
          return FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                var widget;
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    widget = Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 48,
                    );
                  } else {
                    List data = snapshot.data.sublist(0, snapshot.data.length);
                    data.removeWhere((element) =>
                        _activeIndex != 0 && !(element.order_status == _activeIndex));
//                    print(data[0].product_list);
                    widget = ListView(
                      children: data.map<Widget>((order) {
                        return OrderCard(
                          order: order,
                          onUpdate: () {setState(() {
                            _future = getOrderList(context, getToken(context));
                          });},
                        );
                      }).toList(),
                    );
                  }
                } else {
                  widget = Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ));
                }
                return widget;
              });
        }).toList(),
      ),
    );
  }
}
