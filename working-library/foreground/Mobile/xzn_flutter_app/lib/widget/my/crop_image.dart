import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:provider/provider.dart';
import 'package:xzn/conf/config.dart';
import 'package:xzn/services/information_service.dart';
import 'package:xzn/services/token.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:xzn/states/profile_change_notifier.dart';

class CropImageRoute extends StatefulWidget {
  CropImageRoute(this.image);

  File image; //原始图片路径

  @override
  _CropImageRouteState createState() => new _CropImageRouteState();
}

class _CropImageRouteState extends State<CropImageRoute> {
  double baseLeft; //图片左上角的x坐标
  double baseTop; //图片左上角的y坐标
  double imageWidth; //图片宽度，缩放后会变化
  double imageScale = 1; //图片缩放比例
  Image imageView;
  final cropKey = GlobalKey<CropState>();

  @override
  Widget build(BuildContext context) {
    if (widget.image == null) Navigator.of(context).pop();
    var Screen = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          height: Screen.height,
          width: Screen.width,
          child: Stack(
            children: <Widget>[
              Container(
                height: Screen.height * 1,
                child: Crop.file(
                  widget.image,
                  key: cropKey,
                  aspectRatio: 1.0,
                  alwaysShowGrid: true,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 40),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.lightGreen,
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                    onPressed: () {
                      _crop(widget.image);
                    },
                    child: Text(
                      "确认上传",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              )
            ],
          ),
        ));
  }

  Future<void> _crop(File originalFile) async {
    final crop = cropKey.currentState;
    final area = crop.area;
    if (area == null) {
      //裁剪结果为空
      print('裁剪不成功');
    }
    await ImageCrop.requestPermissions().then((value) {
      if (value) {
        ImageCrop.cropImage(
          file: originalFile,
          area: crop.area,
        ).then((value) {
          print("开始上传");
          upload(value);
        });
      } else {
        upload(originalFile);
      }
    });
  }

  ///上传头像
  Future<bool> upload(File file) async {
    var dio = new Dio();
    String url = Config.baseUrl()+"avatar/upload";
    FormData formData = new FormData.fromMap({
      "token": getToken(context),
      "file": await MultipartFile.fromFile(
        file.path, filename: "file")
    });
    var response = await dio.post(url, data: formData);
    var json = jsonDecode(response.data.toString());
    if (json["success"]) {
      DefaultCacheManager().removeFile(Config.baseUrl() + "avatar/load/" + Provider.of<UserModel>(context).user.head_image_id);
      await getInformation(context);
      Navigator.of(context).pop();//这里的url在上一页调用的result可以拿到
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
    }
  }
}
