import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

class AmapWidget extends StatefulWidget {
  AmapWidget({Key key, this.positionChange}):super(key:key);

  ValueChanged positionChange;

  @override
  _AmapWidgetState createState() => _AmapWidgetState();
}

class _AmapWidgetState extends State<AmapWidget> {
  AmapController _controller;
  LatLng postion = LatLng(39, 116);

  Future<bool> requestPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AmapView(
          // 地图类型 (可选)
          mapType: MapType.Standard,
          // 是否显示缩放控件 (可选)
          showZoomControl: true,
          // 是否显示指南针控件 (可选)
          showCompass: true,
          // 是否显示比例尺控件 (可选)
          showScaleControl: true,
          // 是否使能缩放手势 (可选)
          zoomGesturesEnabled: true,
          // 是否使能滚动手势 (可选)
          scrollGesturesEnabled: true,
          // 是否使能旋转手势 (可选)
          rotateGestureEnabled: true,
          // 是否使能倾斜手势 (可选)
          tiltGestureEnabled: true,
          // 缩放级别 (可选)
          zoomLevel: 15,
          // 中心点坐标 (可选)
          centerCoordinate: this.postion,
          // 标记 (可选)
          markers: <MarkerOption>[],
          // 标识点击回调 (可选)
          onMarkerClicked: (Marker marker) {},
          // 地图点击回调 (可选)
          onMapClicked: (LatLng coord) {},
          // 地图拖动开始 (可选)
          onMapMoveStart: (MapMove move) {},
          // 地图拖动结束 (可选)
          onMapMoveEnd: (MapMove move) {},
          // 地图创建完成回调 (可选)
          onMapCreated: (controller) async {
            // requestPermission是权限请求方法, 需要你自己实现
            // 如果不知道怎么处理, 可以参考example工程的实现, example工程依赖了`permission_handler`插件.
            if (await requestPermission()) {
              await controller.showMyLocation(MyLocationOption(show: true));
            }
            _controller = controller;
            await _controller?.showMyLocation(MyLocationOption(
              myLocationType: MyLocationType.Locate,
              interval: Duration(minutes: 4),
            ));
            LatLng tmp = await _controller?.getLocation() as LatLng;
            setState(() {
              this.postion = tmp;
              widget.positionChange(this.postion);
            });
          },
        ),
      ],
    );
  }
}