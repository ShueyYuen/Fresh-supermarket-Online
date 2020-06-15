import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';

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
                      "拍照上传",
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
          upload(value);
        }).catchError(() {
          print('裁剪不成功');
        });
      } else {
        upload(originalFile);
      }
    });
  }

  ///上传头像
  void upload(File file) {
    print(file.path);
//    Dio dio = Dio();
//    dio
//      .post("http://your ip:port/",
//      data: FormData.from({'file': file}))
//      .then((response) {
//      if (!mounted) {
//        return;
//      }
    //处理上传结果
//      UploadIconResult bean = UploadIconResult(response.data);
    print('上传头像成功');
//      if (bean.code == '1') {
//        Navigator.pop(context, bean.data.url);//这里的url在上一页调用的result可以拿到
//      } else {
//        Navigator.pop(context, '');
//      }
//    });
  }
}
