import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xzn/services/picture.dart';
import 'package:xzn/widget/my/crop_image.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  void cropImage(File originalImage) async {
    String result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => CropImageRoute(originalImage)));
    if (result.isEmpty) {
      print('上传失败');
    } else {
      //result是图片上传后拿到的url
      setState(() {
//        iconUrl = result;
//        print('上传成功：$iconUrl');
//        _upgradeRemoteInfo();//后续数据处理，这里是更新头像信息
      });
    }
  }

  Future getImage() async {
    await ImagePicker.pickImage(source: ImageSource.camera)
      .then((image) => cropImage(image));
  }

  Future chooseImage() async {
    await ImagePicker.pickImage(source: ImageSource.gallery)
      .then((image) => cropImage(image));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息"),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          child: CustomAvatar(context),
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: ListView(
//                            crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.lightGreen,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          onPressed: () {
                            getImage();
                          },
                          child: Text(
                            "拍照上传",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          onPressed: () {
                            chooseImage();
                          },
                          child: Text(
                            "相册选择",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ))
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
